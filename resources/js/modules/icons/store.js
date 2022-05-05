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
            console.log(icon);
            // console.log(state.icon_types[index]);
            console.log(state.icon_types.find(item => item.id == icon.icon_type_id).icons);
            state.icon_types.find(item => item.id == icon.icon_type_id).icons.push(icon);
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
        storeIcon({commit}, formData) {


            return axios
                .post('/api/icons', formData, {headers: {
                        'content-type': 'multipart/form-data'
                    }})
                .then(response => {
                    commit('setIcon', response.data.icon);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        }
    },

    getters: {
        icon_types: state => state.icon_types,
    }
};
