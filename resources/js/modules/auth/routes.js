export default [
    {
        path: '/login',
        name: 'login',
        component: () => import('./components/Login'),
    },
    {
        path: '/registration',
        name: 'registration',
        component: () => import('./components/Registration'),
    },
]
