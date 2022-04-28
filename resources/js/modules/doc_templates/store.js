import axios from 'axios';

export default {
    state: {
        doc_templates: [],
        doc_template: null,
        doc_templates_tables: [
            {name: 'Заказ', value: 'App\\Modules\\Contracts\\Models\\Contract'}
        ]
    },

    mutations: {
        setDocTemplates(state, doc_templates) {
            state.doc_templates = doc_templates;
        },
        addDocTemplate(state, doc_templates) {
            state.doc_templates.push(doc_templates);
        },
        getDocTemplate(state, doc_templates) {
            state.doc_template = doc_templates;
        },
        updateDocTemplate(state, doc_templates) {
            let index = state.doc_templates.findIndex(item => item.id === doc_templates.id);
            state.doc_templates[index] = doc_templates;
        },
        deleteDocTemplate(state, id) {
            let index = state.doc_templates.findIndex(item => item.id === id);
            state.doc_templates.splice(index, 1);
        }
    },

    actions: {
        getDocTemplates({commit}) {
            return axios
                .get('/api/doc_templates')
                .then(response => {
                    commit('setDocTemplates', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message);
                });
        },
        createDocTemplate({commit}, credential) {
            commit('startLoading');
            return axios
                .post('/api/doc_templates',  credential)
                .then(response => {
                    commit('addDocTemplate', response.data.doc_template);
                    commit('addMessage', response.data.message)
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        getDocTemplate({commit}, id) {
            commit('startLoading');
            axios
                .get(`/api/doc_templates/${id}`)
                .then(response => {
                    commit('getDocTemplate', response.data);
                }).catch(error => {
                commit('addError', error.response.data.message || error.message)
            }).finally(() => commit('stopLoading'));
        },
        updateDocTemplate({commit}, credential) {
            commit('startLoading');
            return axios
                .patch(`/api/doc_templates/${credential.id}`, credential)
                .then(response => {
                    commit('updateDocTemplate', response.data);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
        deleteDocTemplate({commit}, id) {
            commit('startLoading');
            return axios
                .delete(`/api/doc_templates/${id}`)
                .then(() => {
                    commit('deleteDocTemplate', id);
                }).catch(error => {
                    commit('addError', error.response.data.message || error.message)
                }).finally(() => commit('stopLoading'));
        },
    },

    getters: {
        doc_templates: state => state.doc_templates,
        doc_template: state => state.doc_template,
        doc_templates_tables: state => state.doc_templates_tables,
    }
};
