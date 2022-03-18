import Cookies from "./components/Cookies";
import NotFound from "./components/NotFound";
import About from "./components/About";
import Services from "./components/Services";
import Basket from "./components/Basket";

export default [
    {
        path: '/cookies',
        name: 'cookies',
        component: Cookies,
    },
    {
        path: '/services',
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
    {
        path: '*',
        name: 'not_found',
        component: NotFound,
    }
]
