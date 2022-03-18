import axios from 'axios';

export default {
    state: {
        roles: null,
        role: null,
    },

    mutations: {
        setRoles(state, roles) {
            state.roles = roles;
        },
        addRole(state, role) {
            state.roles.push(role);
        },
        getRole(state, role) {
            state.role = role;
        },
        updateRole(state, new_role) {
            let index = state.roles.findIndex(role => role.id === new_role.id);
            state.roles[index] = new_role;
        },
        deleteRole(state, id) {
            let index = state.roles.findIndex(role => role.id === id);
            state.roles.splice(index, 1);
        }
    },

    actions: {
        getRoles({commit}) {
            commit('startLoading');
            return axios
                .get('/api/roles')
                .then(response => {
                    commit('setRoles', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        createRole({commit}, credential) {
            commit('startLoading');
            return axios
                .post('/api/roles',  credential)
                .then(response => {
                    commit('addRole', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getRole({commit}, id) {
            commit('startLoading');
            axios
                .get(`/api/roles/${id}`)
                .then(response => {
                    commit('getRole', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        updateRole({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/roles/${credential.id}`, credential)
                .then(response => {
                    commit('updateRole', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteRole({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/roles/${id}`)
                .then(() => {
                    commit('deleteRole', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        roles: state => state.roles,
        role: state => state.role,
    }
};
