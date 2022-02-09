import Vue from 'vue';
import VueRouter from 'vue-router';

import Home from './components/Home'
import usersRouter from '../modules/users/routes'

Vue.use(VueRouter);

const router = new VueRouter({
    mode: 'history',
    linkExactActiveClass: 'active',
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
            children: usersRouter,

        },
    ]
});

export default router;
