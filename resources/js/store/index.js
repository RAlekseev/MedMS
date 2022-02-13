
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex);

axios.defaults.baseURL = 'http://localhost:8085';

export default new Vuex.Store({
    state: {
        user: null,
        errors: [],
        messages: [],
    },

    mutations: {
        setUserData (state, userData) {
            state.user = userData
            localStorage.setItem('user', JSON.stringify(userData))
            axios.defaults.headers.common.Authorization = `Bearer ${userData.token}`
        },

        clearUserData () {
            localStorage.removeItem('user')
            location.reload()
        },

        addError (state, error) {
            state.errors.push(error)
        },
        addMessage (state, message) {
            state.messages.push(message)
        }
    },

    actions: {
        login ({ commit }, credentials) {
            return axios
                .post('/api/login', credentials)
                .then(({ data }) => {
                    console.log('store/error');
                    commit('setUserData', data)
                })
        },

        pushError({ commit }, error) {
            commit('addError', error)
        },

        pushMessage({ commit }, message) {
            commit('addMessage', message)
        },

        logout ({ commit }) {
            commit('clearUserData')
        }
    },

    getters : {
        isLogged: state => !!state.user,
        authUser: state => state.user.user,
        errors: state => state.errors,
        messages: state => state.messages,
        can: state => perm => state.user.user && state.user.user.permissions.includes(perm),
    }
})
