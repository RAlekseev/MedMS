import Index from './components/Index'
import Show from './components/Show'
// import Show from './components/Register'
// import VerifyEmail from './components/VerifyEmail'
// import ResendVerification from './components/ResendVerification'

export default [
    {
        path: 'index',
        component: Index,
        name: 'usersIndex',
    },
    {
        path: 'show/:id',
        component: Show,
        name: 'usersShow',
    },
    // {
    //     path: '/register',
    //     component: Register,
    //     name: 'Register',
    //     meta: {
    //         auth: false,
    //     },
    // },
    // {
    //     path: 'email/verify/:user',
    //     component: VerifyEmail,
    //     name: 'Verification email'
    // },
    // {
    //     path: 'email/resend/verification',
    //     component: ResendVerification,
    //     name: 'Verification resend'
    // }
]
