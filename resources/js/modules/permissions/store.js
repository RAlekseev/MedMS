import axios from 'axios';

export default {
    state: {
        permissions: null,
    },

    mutations: {
        setPermissions(state, permissions) {
            state.permissions = permissions
        },
    },

    actions: {
        getPermissions({commit}) {
            commit('startLoading');
            return axios
                .get('/api/permissions')
                .then(response => {
                    commit('setPermissions', response.data);
                }).catch(error => {
                commit('pushError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        permissions: state => state.permissions,
    }
};
