import Vue from 'vue';
import Vuex from 'vuex';
import auth from '../modules/auth/store';
import permissions from '../modules/permissions/store';
import roles from '../modules/roles/store';
import users from '../modules/users/store';

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
        addMessage(state, message) {
            state.messages.push(message)
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

        pushMessage({commit}, message) {
            commit('addMessage', message)
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
        auth,
        permissions,
        roles,
        users,
    },
});
