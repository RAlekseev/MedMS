import Index from './components/Index'
import Show from './components/Show'

export default [
    {
        path: 'services/index',
        component: Index,
        name: 'servicesIndex',
        meta: {permission: 'services-index'},
    },
    {
        path: 'services/show/:id',
        component: Show,
        name: 'serviceShow',
        meta: {permission: 'services-show'},
    },
]
