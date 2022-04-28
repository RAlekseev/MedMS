import axios from 'axios';

export default {
    state: {
        configs: [],
    },

    mutations: {
        setConfigs(state, configs) {
            state.configs = configs;
        },
        updateConfig(state, new_config) {
            let index = state.configs.findIndex(service => service.id === new_config.id);
            state.configs[index] = new_config;
        },
    },

    actions: {
        getConfigs({commit}) {
            return axios
                .get('/api/configs')
                .then(response => {
                    commit('setConfigs', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        updateConfig({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/configs/${credential.id}`, credential)
                .then(response => {
                    commit('updateConfig', response.data.config);
                    commit('addMessage', response.data.message);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        configs: state => state.configs,
        config_value: state => slug => state.configs.find(config => config.slug === slug)?.value
    }
};
