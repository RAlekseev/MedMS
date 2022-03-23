import Profile from './components/Profile'
import Contracts from './components/Contracts'
import BonusCards from './components/BonusCards'

export default [
    {
        path: 'profile',
        component: Profile,
        name: 'profile',
    },
    {
        path: 'profile/contracts',
        component: Contracts,
        name: 'profileContracts',
    },
    {
        path: 'profile/bonus_cards',
        component: BonusCards,
        name: 'profileBonusCard',
    },
]
