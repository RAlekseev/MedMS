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
    },

    actions: {
        putInBasket({commit}, service) {
            commit('putInBasket', service);
        },
        deleteFromBasket({commit}, service_id) {
            commit('deleteFromBasket', service_id);
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
