import axios from 'axios';

export default {
    state: {
        departments: [],
        department: null,
    },

    mutations: {
        setDepartments(state, items) {
            state.departments = items;
        },
        setDepartment(state, item) {
            state.department = item;
        },
    },

    actions: {
        getDepartments({commit}) {
            return axios
                .get('/api/departments')
                .then(response => {
                    commit('setDepartments',
                        // response.data
                            [
                            {
                                id: 1,
                                icon: {"id":19,"icon_type_id":3,"source":"Поиск.svg"},
                                name: 'Стоматология',
                                description: 'ldffldf ffsfwef wefwerg thewrth eherth erthreh erethrehr',
                                employees: [],
                            }
                            ]
                    );
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        getDepartment({commit}, id) {
            commit('startLoading');
            return axios
                .get(`/api/contracts/${id}`)
                .then(response => {
                    commit('setContract', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        departments: state => state.departments,
        department: state => state.department,
    }
};
