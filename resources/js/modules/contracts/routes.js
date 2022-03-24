import Index from './components/Index'
import Create from './components/Create'


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
]
