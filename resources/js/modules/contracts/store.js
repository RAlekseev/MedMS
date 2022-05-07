import axios from 'axios';
import router from "../../core/router";

export default {
    state: {
        contracts: [],
        contract: null,
        contract_model: "App\\Modules\\Contracts\\Models\\Contract",
        contract_media: null,
    },

    mutations: {
        setContracts(state, contracts) {
            state.contracts = contracts;
        },
        setContract(state, contract) {
            state.contract = contract;
        },
        setContractMedia(state, media) {
            state.contract_media = media;
        },
    },

    actions: {
        getContracts({commit}) {
            return axios
                .get('/api/contracts')
                .then(response => {
                    commit('setContracts', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        createContract({commit}, basket) {
            commit('startLoading');
            return axios
                .post('/api/contracts', basket)
                .then(response => {
                    commit('cleanBasket');
                    commit('addMessage', response.data.message);
                    router.push({path: '/contracts'})
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getContract({commit}, id) {
            commit('startLoading');
            return axios
                .get(`/api/contracts/${id}`)
                .then(response => {
                    commit('setContract', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                }).finally(() => commit('stopLoading'));
        },

        storeContractDoc({commit, getters}, formData) {
            formData.append('model', getters.contract_model);
            formData.append('id', router.currentRoute.params.id);
            return axios
                .post(`/api/media/store`, formData,
                    {headers: {'content-type': 'multipart/form-data'}})
                .then(response => {
                    // commit('setIcon', response.data.icon);
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },

        getContractMedia({commit, getters}) {
            const params = {
                params: {
                    model: getters.contract_model,
                    id: router.currentRoute.params.id,
                }
            };
            return axios
                .get(`/api/media/get`, params)
                .then(response => {
                    commit('setContractMedia', response.data.files);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
    },

    getters: {
        contracts: state => state.contracts,
        contract: state => state.contract,
        contract_media: state => state.contract_media,
        contract_model: state => state.contract_model,
    }
};
