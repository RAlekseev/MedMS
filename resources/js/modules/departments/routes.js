import Index from './components/Index'
import Show from "./components/Show";


export default [
    {
        path: '/departments',
        component: Index,
        name: 'departmentsIndex',
        meta: {permission: 'departments-index'},
    },
    {
        path: '/departments/show/:id',
        component: Show,
        name: 'departmentsShow',
        meta: {permission: 'departments-show'},
    },
]
