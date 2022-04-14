import Vue from 'vue';
import VueRouter from 'vue-router';

import Layout from './components/Layout'
import Home from './components/Home'

import auth from '../modules/auth/routes'
import common from '../modules/common/routes'
import profile from '../modules/profile/routes'

import users from '../modules/users/routes'
import roles from '../modules/roles/routes'
import permissions from '../modules/permissions/routes'
import services from '../modules/services/routes'
import schedules from '../modules/schedules/routes'
import contracts from '../modules/contracts/routes'
import configs from '../modules/configs/routes'

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
            component: Layout,
            meta: { requiresAuth: true },
            children: [
                ...users,
                ...roles,
                ...permissions,
                ...schedules,
                ...services,
                ...profile,
                ...contracts,
                ...configs,
            ],

        },
        ...auth,
        ...common,
    ]
});

router.beforeEach((to, from, next) => {
    let user = JSON.parse(localStorage.getItem('user'))?.user;

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
