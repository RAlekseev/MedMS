import Index from './components/Index'
import Show from './components/Show'

export default [
    {
        path: 'users',
        component: Index,
        name: 'usersIndex',
        meta: {permission: 'users-index'},
    },
    {
        path: 'users/show/:id',
        component: Show,
        name: 'usersShow',
        meta: {permission: 'users-show'},
    },
]
