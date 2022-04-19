import axios from 'axios';

export default {
    state: {

    },
    mutations: {

    },
    actions: {
        updateWorkingHours({commit}, credentials) {
            commit('startLoading');
            return axios
                .post(`/api/working_hours`, credentials)
                .then(response => {
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.message || error.response.data.message)
                }).finally(() => commit('stopLoading'));
        },
    },
    getters: {

    }
};
