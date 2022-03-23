import axios from 'axios'
import router from '../../core/router';

export default {
    state: {
        basketServices: [],
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
        }
    },

    actions: {
        putInBasket({commit}, service) {
            commit('putInBasket', service);
        },
        deleteFromBasket({commit}, service_id) {
            commit('deleteFromBasket', service_id);
        },
        cleanBasket({commit}) {
            commit('cleanBasket');
        },
        createContract({commit}, basket) {
            commit('startLoading');
            console.log(basket)
            return axios
                .post('/api/patient/contracts', basket)
                .then(response => {
                    commit('cleanBasket');
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        }
    },

    getters: {
        basketServices: state => state.basketServices,
        isServiceInBasket: state => service => !!state.basketServices.filter(basket => basket.id === service.id).length,
        basketSum: state => state.basketServices.reduce((sum, service) => {
            return sum + service.price
        }, 0),
    }
}
