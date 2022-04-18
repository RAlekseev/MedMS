import axios from 'axios';

export default {
    state: {
        employees: null,
    },

    mutations: {
        setEmployees(state, users) {
            state.employees = users;
        },
    },

    actions: {
        getEmployees({commit}) {
            commit('startLoading');
            return axios
                .get('/api/users/employees')
                .then(response => {
                    commit('setEmployees', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        employees: state => state.employees,
    }
};
