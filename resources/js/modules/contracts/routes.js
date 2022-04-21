import Index from './components/Index'
import Create from './components/Create'
import Show from "./components/Show";


export default [
    {
        path: '/contracts',
        component: Index,
        name: 'contractsIndex',
        meta: {permission: 'contracts-index'},
    },
    {
        path: '/contracts/create/:id?',
        component: Create,
        name: 'contractsCreate',
        meta: {permission: 'contracts-create'},
    },
    {
        path: '/contracts/show/:id',
        component: Show,
        name: 'contractsShow',
        meta: {permission: 'contracts-show'},
    },
]
