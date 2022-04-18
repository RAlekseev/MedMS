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
                    console.log(response);
                    this.dispatch('getEmployees');
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    console.log(error);
                    commit('addError', error.message || error.response.data.message)
                }).finally(() => commit('stopLoading'));
        },
    },
    getters: {

    }
};
