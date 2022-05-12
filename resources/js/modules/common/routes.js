export default [
    {
        path: '/',
        name: 'home',
        component: () => import('./components/home/Index'),
    },
    {
        path: '/cookies',
        name: 'cookies',
        component: () => import('./components/Cookies'),
    },
    {
        path: '/services/:id?',
        name: 'services',
        component: () => import('./components/Services'),
        meta: {
            sitemap: {
                slugs: [{
                    id: 'category-id',
                }]
            }
        }
    },
    {
        path: '/about',
        name: 'about',
        component: () => import('./components/about/Index'),
    },
    {
        path: '/basket',
        name: 'basket',
        component: () => import('./components/Basket'),
    },
]
