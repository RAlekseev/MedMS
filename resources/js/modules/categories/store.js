import axios from 'axios';

export default {
    state: {
        categories: null,
        category: null,
    },

    mutations: {
        setCategories(state, categories) {
            state.categories = categories;
        },
        addCategory(state, category) {
            state.categories.push(category);
        },
        getCategory(state, category) {
            state.category = category;
        },
        updateCategory(state, category) {
            let index = state.categories.findIndex(item => item.id === category.id);
            state.categories[index] = category;
        },
        deleteCategory(state, id) {
            let index = state.categories.findIndex(item => item.id === id);
            state.categories.splice(index, 1);
        }
    },

    actions: {
        getCategories({commit}) {
            return axios
                .get('/api/categories')
                .then(response => {
                    commit('setCategories', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        createCategory({commit}, credential) {
            commit('startLoading');
            return axios
                .post('/api/categories',  credential)
                .then(response => {
                    commit('addCategory', response.data.category);
                    commit('addMessage', response.data.message)
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getCategory({commit}, id) {
            commit('startLoading');
            axios
                .get(`/api/categories/${id}`)
                .then(response => {
                    commit('getCategory', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        updateCategory({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/categories/${credential.id}`, credential)
                .then(response => {
                    commit('updateCategory', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteCategory({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/categories/${id}`)
                .then(() => {
                    commit('deleteCategory', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        categories: state => state.categories,
        category: state => state.category,
    }
};
