import axios from 'axios'
import router from '../../core/router';

export default {
    state: {
        basketServices: [],
        searchResults: [],
    },

    mutations: {
        putInBasket(state, service) {
            state.basketServices.push(service)
        },

        deleteFromBasket(state, id) {
            let index = state.basketServices.findIndex(service => service.id === id);
            state.basketServices.splice(index, 1);
        },
        cleanBasket(state) {
            state.basketServices = [];
        },
        setSearchResults(state, results) {
            state.searchResults = results;
        }
    },

    actions: {
        getGuestServicesCategories({commit}) {
            return axios
                .get('/api/guest_services')
                .then(response => {
                    commit('setServices', response.data.services);
                    commit('setCategories', response.data.categories);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        putInBasket({commit}, service) {
            commit('putInBasket', service);
        },
        deleteFromBasket({commit}, service_id) {
            commit('deleteFromBasket', service_id);
        },
        cleanBasket({commit}) {
            commit('cleanBasket');
        },
        createMyContract({commit}, basket) {
            commit('startLoading');
            return axios
                .post('/api/patient/contracts', basket)
                .then(response => {
                    commit('cleanBasket');
                    commit('addMessage', response.data.message);
                    router.push({path: '/profile/contracts'})
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        makeSearch({commit}, query) {
            return axios
                .post('/api/search', query)
                .then(response => {
                    commit('setSearchResults', response.data.result);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                });
        },
    },

    getters: {
        basketServices: state => state.basketServices,
        isServiceInBasket: state => service => !!state.basketServices.filter(basket => basket.id === service.id).length,
        basketSum: state => state.basketServices.reduce((sum, service) => {
            return sum + service.price
        }, 0),
        searchResults: state => state.searchResults,
    }
}
