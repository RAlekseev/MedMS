import Login from "./components/Login";
import Registration from "./components/Registration";

export default [
    {
        path: '/login',
        name: 'login',
        component: Login,
    },
    {
        path: '/registration',
        name: 'registration',
        component: Registration,
    },
]
