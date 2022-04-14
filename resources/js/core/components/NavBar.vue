<template>
    <div>
        <div class="container-top bg-light">
            <div class="menu-top px-0">
                <div class="menu-button">
                    <!--          <button type="button" class="btn btn-rounded btn-amber bg-primary text-white">-->
                    <!--            <i class="fas fa-calendar pr-2" aria-hidden="true"></i>-->
                    <!--            Записаться на прием-->
                    <!--          </button>-->
                    <div class="menu-button-item">
                        <a :href="'tel:'+config_value('org_phone')" class="phone">
                            <div>
                                <i class="fa fa-phone-alt pr-2" aria-hidden="true"></i>
                                <span class="phone-desktop">{{config_value('org_phone')}}</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="menu-button mobile-auth-link">
                    <router-link :to="{name: 'login'}" class="px-0" role="button" v-if="!isLogged">
                        Вход
                    </router-link>
                    <span v-if="!isLogged">|</span>
                    <router-link :to="{name: 'registration'}" class="px-0" role="button"
                                 v-if="!isLogged">
                        Регистрация
                    </router-link>
                </div>
                <div class="lang-dropdown show">
                    <a class="btn btn-outline-light dropdown" href="#" role="button" id="dropdownMenuLink"
                       data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <img src="/assets/img/flags/ru.png" width="25px" height="25px">
                    </a>
                    <div class="dropdown-menu" style="width: 60px" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#"><img src="/assets/img/flags/en.png" width="25px"
                                                               height="25px"></a>
                        <a class="dropdown-item" href="#"><img src="/assets/img/flags/kg.png" width="25px"
                                                               height="25px"></a>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3" v-if="isLogged">
                <i class="fa fa-bars"></i>
            </button>


            <router-link class="ml-1 sidebar-brand d-flex align-items-center justify-content-center"
                         :to="{ name: 'home' }"
                         v-else>

                <div class="sidebar-brand-icon">
                    <i class="fas fa-heartbeat fa-2x"></i>
                </div>
                <div class="sidebar-brand-text mx-3">MedMS<sup>1</sup></div>
            </router-link>

            <!-- Topbar Search -->
            <span class="search-form" >
            <NavBarSearch :searchStyle="searchStyle"></NavBarSearch>
            </span>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item no-arrow mx-1 my-auto mobile-search-icon" @click="toggleSearch">
                    <i class="fa fa-search"></i>
                </li>
                <li class="nav-item no-arrow mx-1">
                    <router-link :to="{name: 'services'}" class="nav-link text-gray-500" role="button">
                        Услуги
                    </router-link>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <router-link :to="{name: 'about'}" class="nav-link text-gray-500" role="button">
                        О нас
                    </router-link>
                </li>
                <li class="nav-item dropdown no-arrow mx-1">
                    <router-link :to="{name: 'basket'}" class="nav-link text-gray-500" role="button">
                        <!--                        <i class="fa fa-shopping-bag"></i> <br>-->
                        Корзина
                        ({{basketSum}})
                    </router-link>
                </li>

                <div class="topbar-divider d-none d-sm-block navbar-auth-link"></div>

                <!-- Nav Item - User Information -->
                <li class="nav-item dropdown no-arrow" v-if="isLogged">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ authUser.full_name }}</span>
                        <img class="img-profile rounded-circle"
                             src="/assets/img/undraw_profile.svg">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                         aria-labelledby="userDropdown">
                        <router-link to="/profile" class="dropdown-item">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Профиль
                        </router-link>
                        <router-link to="/profile/contracts" class="dropdown-item" href="#">
                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                            Мои заказы
                        </router-link>
<!--                        <a class="dropdown-item" href="#">-->
<!--                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>-->
<!--                            Activity Log-->
<!--                        </a>-->
<!--                        <router-link to="/profile/contracts" class="dropdown-item" href="#">-->
<!--                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>-->
<!--                            Настройки-->
<!--                        </router-link>-->
                        <div class="dropdown-divider"></div>
                        <button class="dropdown-item" @click="logout">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Выход
                        </button>
                    </div>
                </li>
                <li class="nav-item dropdown no-arrow mx-1 navbar-auth-link" v-if="!isLogged">
                    <router-link :to="{name: 'login'}" class="nav-link" role="button">
                        Войти
                    </router-link>
                </li>
                <li class="nav-item dropdown no-arrow mx-1 navbar-auth-link" v-if="!isLogged">
                    <router-link :to="{name: 'registration'}" class="nav-link" role="button">
                        Регистрация
                    </router-link>
                </li>
            </ul>
        </nav>
    </div>
</template>


<script>
    import {mapGetters} from 'vuex';
    import NavBarSearch from './NavBarSearch'

    export default {
        data() {
            return {
                searchStyle: null
            }
        },
        components: {
            NavBarSearch
        },
        computed: {
            ...mapGetters([
                'isLogged',
                'authUser',
                'basketSum',
                'config_value',
            ])
        },
        mounted() {
            this.$store.dispatch('getConfigs')
        },
        methods: {
            logout() {
                this.$store.dispatch('logout');
            },
            toggleSearch() {
                this.searchStyle = this.searchStyle ? null : {display: 'block!important', width: '250px'}
            },
        },
    }
</script>

<style scoped>

    @media screen and (min-width: 880px) {
        .mobile-auth-link {
            visibility: hidden;
            display: none;
        }
    }

    .mobile-auth-link {

    }

    @media screen and (max-width: 1025px) {
        .sidebar-brand-text {
            visibility: hidden;
            display: none;
        }
    }

    @media screen and (max-width: 500px) {
        .phone-desktop {
            visibility: hidden;
            display: none;
        }
    }

    @media screen and (min-width: 576px) {
        .mobile-search-icon {
            visibility: hidden;
            display: none;
        }
    }

    @media screen and (max-width: 950px) {
        .navbar-auth-link {
            visibility: hidden;
            display: none!important;
        }
    }

    .sidebar .sidebar-brand {
        text-transform: none;
    }

    .sidebar-brand-icon {
        padding-right: 12px;
    }

    .menu-top {
        height: 36px;
        max-width: 1360px;
        margin: 0 auto;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        padding: 0 30px
    }

    .menu-button {
        -webkit-box-flex: 1;
        flex-grow: 1;
    }

    .menu-button {
        display: inline-block;
    }

    .menu-button-item {
        display: inline-block;
    }

    .container-top a {
        background: transparent;
        z-index: 1;
    }

    .phone {
        font-size: 14px;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        height: 36px;
        /*padding: 0 20px 0 44px;*/
        position: relative;
        text-decoration: none;
        padding: .375rem .75rem;
    }

    .dropdown-menu {
        width: 60px;
        min-width: 80px;
    }

    span {
        font-size: 16px;
    }
</style>

