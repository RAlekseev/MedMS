import axios from 'axios';

export default {
    state: {
        services: [],
        service: null,
        categories: [],
    },

    mutations: {
        setServices(state, services) {
            state.services = services;
        },
        addService(state, service) {
            state.services.push(service);
        },
        getService(state, service) {
            state.service = service;
        },
        updateService(state, new_service) {
            let index = state.services.findIndex(service => service.id === new_service.id);
            state.services[index] = new_service;
        },
        deleteService(state, id) {
            let index = state.services.findIndex(service => service.id === id);
            state.services.splice(index, 1);
        },

        setCategories(state, categories) {
            state.categories = categories;
        },
    },

    actions: {
        getServices({commit}) {
            return axios
                .get('/api/services')
                .then(response => {
                    commit('setServices', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        createService({commit}, credential) {
            commit('startLoading');
            return axios
                .post('/api/services', credential)
                .then(response => {
                    commit('addService', response.data.service);
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                }).finally(() => commit('stopLoading'));
        },
        getService({commit}, id) {
            commit('startLoading');
            axios
                .get(`/api/services/${id}`)
                .then(response => {
                    commit('getService', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message);
            }).finally(() => commit('stopLoading'));
        },
        updateService({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/services/${credential.id}`, credential)
                .then(response => {
                    commit('updateService', response.data.service);
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteService({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/services/${id}`)
                .then(() => {
                    commit('deleteService', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        services: state => state.services,
        service: state => state.service,
    }
};
