import axios from 'axios'
import router from '../../core/router';

export default {
    state: {
        user: null,
    },

    mutations: {
        setUserData(state, userData) {
            state.user = userData;
            localStorage.setItem('user', JSON.stringify(userData));
            axios.defaults.headers.common.Authorization = `Bearer ${userData.token}`
        },

        clearUserData(state) {
            state.user = null;
            localStorage.removeItem('user');
            location.reload()
        },
    },

    actions: {
        login({commit}, credentials) {
            let redirect_to = router.currentRoute.query?.redirect || '/';
            return axios
                .post('/api/login', credentials)
                .then(({data}) => {
                    commit('setUserData', data)
                    router.push({path: redirect_to})
                })
                .catch(error => {
                    commit('addError', error.response.data.message || error.message)
                });
        },
        registration({commit}, credentials) {
            axios
                .post(`api/registration`, credentials)
                .then(response => {
                    commit('addMessage', "Вы успешно зарегистрировали аккаунт!");
                    router.push({ name: 'login' })
                })
                .catch(error => {
                    for(let item of Object.values(error.response.data.errors)){
                        commit('addError', item[0]);
                    }
                });
        },
        logout({commit}) {
            axios
                .post(`/api/logout`)
                .then(response => {
                    commit('clearUserData')
                })
                .catch(error => {
                    commit('addError', error.response.data.message || error.message)
                });
        }
    },

    getters: {
        isLogged: state => !!state.user,
        authUser: state => state.user.user,
        can: state => (...perms) => state.user.user && state.user.user.permissions.filter(x => perms.includes(x)).length,
    }
}
