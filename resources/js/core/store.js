import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from "vuex-persistedstate"


import common from '../modules/common/store';
import auth from '../modules/auth/store';
import profile from '../modules/profile/store';

import permissions from '../modules/permissions/store';
import roles from '../modules/roles/store';
import users from '../modules/users/store';
import services from '../modules/services/store';

Vue.use(Vuex);

export const store = new Vuex.Store({
    state: {
        errors: [],
        messages: [],
        loading: false,
    },
    getters: {
        errors: state => state.errors,
        messages: state => state.messages,
        loading: state => state.loading,
    },
    mutations: {
        addError(state, error) {
            state.errors.push(error)
        },
        deleteError(state, error) {
            let index = state.errors.findIndex(index_error => index_error === error);
            state.errors.splice(index, 1);
        },
        addMessage(state, message) {
            state.messages.push(message)
        },
        deleteMessage(state, message) {
            let index = state.messages.findIndex(index_messages => index_messages === message);
            state.messages.splice(index, 1);
        },

        startLoading(state) {
            state.loading = true
        },
        stopLoading(state) {
            state.loading = false
        },

    },
    actions: {
        pushError({commit}, error) {
            commit('addError', error)
        },
        removeError({commit}, error) {
            commit('deleteError', error)
        },

        pushMessage({commit}, message) {
            commit('addMessage', message)
        },
        removeMessage({commit}, message) {
            commit('deleteMessage', message)
        },

        startLoading({commit}) {
            commit('startLoading')
        },
        stopLoading({commit}) {
            commit('stopLoading')
        },
        request({commit}, request) {
            commit('startLoading');
            return axios
                .get('/api/roles')
                .then(response => {
                    commit('setRoles', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        }
    },
    modules: {
        common,
        auth,
        permissions,
        roles,
        users,
        services,
        profile,
    },
    plugins: [createPersistedState()],
});
