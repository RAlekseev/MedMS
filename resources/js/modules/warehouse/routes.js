import Index from './components/Index'
import Movements from './components/Movements'

export default [
    {
        path: '/warehouse',
        component: Index,
        name: 'warehouseIndex',
        meta: {permission: 'warehouse-index'},
    },
    {
        path: '/warehouse/movements',
        component: Movements,
        name: 'warehouseShow',
        meta: {permission: 'warehouse-movements'},
    },
]
