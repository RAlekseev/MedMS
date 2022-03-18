import Vue from 'vue';
import VueRouter from 'vue-router';

import Home from './components/Home'

import auth from '../modules/auth/routes'
import common from '../modules/common/routes'

import usersRouter from '../modules/users/routes'
import rolesRouter from '../modules/roles/routes'
import permissionsRouter from '../modules/permissions/routes'
import schedulesRouter from '../modules/schedules/routes'

Vue.use(VueRouter);

const router = new VueRouter({
    mode: 'history',
    linkExactActiveClass: 'active',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
        },

        {
            path: '/',
            component: Home,
            meta: { requiresAuth: true },
            children: [
                ...usersRouter,
                ...rolesRouter,
                ...permissionsRouter,
                ...schedulesRouter,
            ],

        },
        ...auth,
        ...common,
    ]
});

router.beforeEach((to, from, next) => {
    let user = JSON.parse(localStorage.getItem('user'))?.user;

    // console.log(user.permissions);
    //Auth check
    if (to.matched.some(record => record.meta.requiresAuth) && !user) {
        next({
            path: '/login',
            query: { redirect: to.fullPath }
        });
    } else {
        //Permission check
        if (to.meta.permission && !user.permissions.includes(to.meta.permission)) {
            next('/not_found');
        } else {
            next();
        }
    }
});

export default router;
