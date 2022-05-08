import Index from './components/Index'
import Movements from './components/Movements'
import Show from "./components/Show";


export default [
    {
        path: '/warehouse',
        component: Index,
        name: 'warehouseIndex',
        meta: {permission: 'warehouse-index'},
    },
    {
        path: '/warehouse/show/:id',
        component: Show,
        name: 'inventoryShow',
        meta: {permission: 'warehouse-show'},
    },
    {
        path: '/warehouse/movements',
        component: Movements,
        name: 'warehouseShow',
        meta: {permission: 'warehouse-movements'},
    },
]
