import Index from './components/Index'
import Show from './components/Show'

export default [
    {
        path: 'users',
        component: Index,
        name: 'usersIndex',
    },
    {
        path: 'users/show/:id',
        component: Show,
        name: 'usersShow',
    },
]
