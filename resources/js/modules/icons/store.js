import axios from 'axios';

export default {
    state: {
        icon_types: null,
    },

    mutations: {
        setIconTypes(state, icons) {
            state.icon_types = icons;
        },
        setIcon(state, icon) {
            state.icon_types.find(icon_type => icon_type.id === icon.icon_type_id).icons.push(icon);
        },
    },

    actions: {
        getIconTypes({commit}) {
            return axios
                .get('/api/icons')
                .then(response => {
                    commit('setIconTypes', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        storeIcon({commit}, image) {
            return axios
                .post('/api/icons')
                .then(response => {
                    commit('setIcon', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        }
    },

    getters: {
        icon_types: state => state.icon_types,
    }
};
