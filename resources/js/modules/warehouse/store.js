import axios from 'axios';

export default {
    state: {
        inventories: null,
        movements: null,
        warehouse_requests: [],
        my_warehouse_requests: [],
    },

    mutations: {
        setInventories(state, items) {
            state.inventories = items;
        },
        setMovements(state, items) {
            state.movements = items;
        },
        setWarehouseRequests(state, items) {

            state.warehouse_requests = items;
        },
        setMyWarehouseRequests(state, items) {
            state.my_warehouse_requests = items;
        },
        deleteWarehouseInventory(state, id) {
            let index = state.inventories.findIndex(item => item.id === id);
            state.inventories.splice(index, 1);
        },
        addWarehouseRequest(state, item) {
            state.my_warehouse_requests.push(item)
        },
        updateWarehouseRequest(state, request) {
            let index = state.warehouse_requests.findIndex(item => item.id === request.id);
            state.warehouse_requests[index] = request;
        },
        deleteWarehouseRequest(state, id) {
            let index = state.warehouse_requests.findIndex(item => item.id === id);
            state.warehouse_requests.splice(index, 1);
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
        createMovement({commit}, movement) {
            commit('startLoading');
            return axios
                .post('/api/warehouse/movements', movement)
                .then(response => {
                    // commit('setMovements', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },

        getWarehouseRequests({commit}) {
            commit('startLoading');
            return axios
                .get('/api/warehouse/requests')
                .then(response => {
                    commit('setWarehouseRequests',
                        response.data
                    );
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getMyWarehouseRequests({commit}) {
            commit('startLoading');
            return axios
                .get('/api/warehouse/my_requests')
                .then(response => {
                    commit('setMyWarehouseRequests',
                        response.data
                    );
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        createWarehouseRequest({commit}, item) {
            commit('startLoading');
            return axios
                .post('/api/warehouse/requests', item)
                .then(response => {
                    commit('addWarehouseRequest', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        updateWarehouseRequest({commit}, item) {
            commit('startLoading');
            return axios
                .patch(`/api/warehouse/requests/${item.id}`, item)
                .then(response => {
                    commit('updateWarehouseRequest', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteWarehouseRequest({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/warehouse/requests/${id}`)
                .then(() => {
                    commit('deleteWarehouseRequest', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteWarehouseInventory({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/warehouse/inventories/${id}`)
                .then(() => {
                    commit('deleteWarehouseInventory', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        inventories: state => state.inventories,
        movements: state => state.movements,
        warehouse_requests: state => state.warehouse_requests,
        my_warehouse_requests: state => state.my_warehouse_requests,
    }
};
