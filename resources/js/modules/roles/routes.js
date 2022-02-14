import Index from './components/Index'
import Show from './components/Show'

export default [
    {
        path: 'roles',
        component: Index,
        name: 'rolesIndex',
    },
    {
        path: 'roles/show/:id',
        component: Show,
        name: 'roleShow',
    },
]
