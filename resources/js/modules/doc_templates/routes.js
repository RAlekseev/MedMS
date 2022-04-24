import Index from './components/Index'
import Show from './components/Show'

export default [
    {
        path: 'doc_templates',
        component: Index,
        meta: {permission: 'doc-templates-index'},
    },
    {
        path: 'doc_templates/show/:id',
        component: Show,
        meta: {permission: 'doc-templates-show'},
    },
]
