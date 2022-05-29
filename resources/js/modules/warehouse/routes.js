import Index from './components/Index'
import Movements from './components/Movements'
import Requests from './components/Requests'
import MyRequests from './components/MyRequests'

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
    {
        path: '/warehouse/requests',
        component: Requests,
        name: 'warehouseRequests',
        meta: {permission: 'warehouse-requests'},
    },
    {
        path: '/warehouse/my_requests',
        component: MyRequests,
        name: 'warehouseMyRequests',
        meta: {permission: 'warehouse-my-requests'},
    },
]
