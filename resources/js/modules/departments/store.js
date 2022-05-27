import axios from 'axios';
import router from "../../core/router";

export default {
    state: {
        departments: [],
        department: null,
    },

    mutations: {
        setDepartments(state, items) {
            state.departments = items;
        },
        addDepartment(state, item) {
            state.departments.push(item);
        },
        setDepartment(state, item) {
            state.department = item;
        },
        updateDepartment(state, department) {
            let index = state.departments.findIndex(item => item.id === department.id);
            state.departments[index] = department;
        },
        deleteDepartment(state, id) {
            let index = state.departments.findIndex(item => item.id === id);
            state.departments.splice(index, 1);
        }
    },

    actions: {
        getDepartments({commit}) {
            return axios
                .get('/api/departments')
                .then(response => {
                    commit('setDepartments', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        createDepartment({commit}, form) {
            commit('startLoading');
            return axios
                .post('/api/departments', form)
                .then(response => {
                    commit('addDepartment', response.data.department);
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
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
        updateDepartment({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/departments/${credential.id}`, credential)
                .then(response => {
                    commit('updateDepartment', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteDepartment({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/departments/${id}`)
                .then(() => {
                    commit('deleteDepartment', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },

    },

    getters: {
        departments: state => state.departments,
        department: state => state.department,
    }
};
