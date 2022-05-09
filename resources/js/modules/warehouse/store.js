import axios from 'axios';

export default {
    state: {
        inventories: null,
        movements: null,
    },

    mutations: {
        setInventories(state, items) {
            state.inventories = items;
        },
        setMovements(state, items) {
            state.movements = items;
        },
    },

    actions: {
        getInventories({commit}) {
            commit('startLoading');
            return axios
                .get('/api/warehouse/inventories')
                .then(response => {
                    commit('setInventories', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getMovements({commit}) {
            commit('startLoading');
            return axios
                .get('/api/warehouse/movements')
                .then(response => {
                    commit('setMovements', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        inventories: state => state.inventories,
        movements: state => state.movements,
    }
};
