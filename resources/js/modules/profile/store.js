import axios from 'axios';

export default {
    state: {
        myContracts: [],
    },

    mutations: {
        setMyContracts(state, contracts) {
            state.myContracts = contracts;
        },
    },

    actions: {
        getMyContracts({commit}) {
            return axios
                .get('/api/patient/contracts')
                .then(response => {
                    commit('setMyContracts', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
    },

    getters: {
        myContracts: state => state.myContracts,
    }
};
