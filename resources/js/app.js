/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

window.Vue = require('vue').default;

window.$ = window.jquery = require('jquery');
require('datatables.net');
import "./core/utils/bootstrap.bundle.min";

import router from './core/router';
import App from './core/App';
import {store} from './core/store';
import axios from 'axios';

import VueMeta from 'vue-meta';
Vue.use(VueMeta);

import VueMask from 'v-mask'
Vue.use(VueMask);

import VueViewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'
Vue.use(VueViewer);
import scss from './core/scss/sb-admin-2.scss'
window.JSZip = require("jszip");

import 'datatables.net-dt/css/jquery.dataTables.css'
import 'datatables.net'
import 'datatables.net-searchbuilder'
import 'datatables.net-buttons/js/dataTables.buttons.js'
import 'datatables.net-buttons/js/buttons.html5.js'
import 'datatables.net-buttons/js/buttons.print.js'

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    store,
    router,
    created () {
        const userInfo = localStorage.getItem('user');
        if (userInfo) {
            this.$store.commit('setUserData', JSON.parse(userInfo));
        }
        axios.interceptors.response.use(
            response => response,
            error => {
                if (error.response.status === 401) {
                    this.$store.dispatch('logout')
                }
                return Promise.reject(error)
            }
        )
    },
    render: h => h(App)
}).$mount('#app');
