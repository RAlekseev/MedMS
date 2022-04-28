import Cookies from "./components/Cookies";
import About from "./components/About";
import Services from "./components/Services";
import Basket from "./components/Basket";
import Home from "./components/home/Index";

export default [
    {
        path: '/',
        name: 'home',
        component: Home,
    },
    {
        path: '/cookies',
        name: 'cookies',
        component: Cookies,
    },
    {
        path: '/services/:id?',
        name: 'services',
        component: Services,
    },
    {
        path: '/about',
        name: 'about',
        component: About,
    },
    {
        path: '/basket',
        name: 'basket',
        component: Basket,
    },
]
