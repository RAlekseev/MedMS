import axios from 'axios';

export default {
    state: {
        users: null,
        user: null,
    },

    mutations: {
        setUsers(state, users) {
            state.users = users;
        },
        addUser(state, user) {
            state.users.push(user);
        },
        getUser(state, user) {
            state.user = user;
        },
        updateUser(state, user) {
            let index = state.users.findIndex(item => item.id === user.id);
            state.users[index] = user;
        },
        deleteUser(state, id) {
            let index = state.users.findIndex(item => item.id === id);
            state.users.splice(index, 1);
        }
    },

    actions: {
        getUsers({commit}) {
            commit('startLoading');
            return axios
                .get('/api/users')
                .then(response => {
                    commit('setUsers', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        createUser({commit}, credential) {
            commit('startLoading');
            return axios
                .post('/api/users',  credential)
                .then(response => {
                    commit('addUser', response.data.user);
                    commit('addMessage', response.data.message)
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getUser({commit}, id) {
            commit('startLoading');
            axios
                .get(`/api/users/${id}`)
                .then(response => {
                    commit('getUser', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        updateUser({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/users/${credential.id}`, credential)
                .then(response => {
                    commit('updateUser', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteUser({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/users/${id}`)
                .then(() => {
                    commit('deleteUser', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        users: state => state.users,
        user: state => state.user,
    }
};
