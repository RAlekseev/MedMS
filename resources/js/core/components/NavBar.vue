<template>
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3" v-if="isLogged">
            <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Search -->
<!--        <form-->
<!--            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">-->
<!--            <div class="input-group">-->
<!--                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."-->
<!--                       aria-label="Search" aria-describedby="basic-addon2">-->
<!--                <div class="input-group-append">-->
<!--                    <button class="btn btn-primary" type="button">-->
<!--                        <i class="fas fa-search fa-sm"></i>-->
<!--                    </button>-->
<!--                </div>-->
<!--            </div>-->
<!--        </form>-->

        <router-link class="ml-1 sidebar-brand d-flex align-items-center justify-content-center" :to="{ name: 'home' }" v-else>

            <div class="sidebar-brand-icon">
                <i class="fas fa-heartbeat fa-2x"></i>
            </div>
            <div class="sidebar-brand-text mx-3">MedMS<sup>1</sup></div>
        </router-link>

<!--        <div class="sidebar-brand-icon text-primary ml-2">-->
<!--            <i class="fas fa-heartbeat fa-2x"></i>-->
<!--        </div>-->

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown no-arrow mx-1">
                <router-link :to="{name: 'services'}" class="nav-link" role="button">
                    Услуги
                </router-link>
            </li>

            <li class="nav-item dropdown no-arrow mx-1">
                <router-link :to="{name: 'about'}" class="nav-link" role="button">
                    О нас
                </router-link>
            </li>

            <li class="nav-item dropdown no-arrow mx-1">
                <router-link :to="{name: 'basket'}" class="nav-link" role="button">
                    Корзина
                </router-link>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow" v-if="isLogged">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{authUser.full_name}}</span>
                    <img class="img-profile rounded-circle"
                         src="/assets/img/undraw_profile.svg">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                        Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <button class="dropdown-item" @click="logout">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </button>
                </div>
            </li>
            <li class="nav-item dropdown no-arrow mx-1" v-if="!isLogged">
                <router-link :to="{name: 'login'}" class="nav-link" role="button">
                    Войти
                </router-link>
            </li>
            <li class="nav-item dropdown no-arrow mx-1" v-if="!isLogged">
                <router-link :to="{name: 'registration'}" class="nav-link" role="button">
                    Регистрация
                </router-link>
            </li>


        </ul>

    </nav>
</template>

<script>
    import { mapGetters } from 'vuex'

    export default {
        computed: {
            ...mapGetters([
                'isLogged',
                'authUser'
            ])
        },
        methods: {
            logout() {
                this.$store.dispatch('logout');
            }
        },
    }
</script>

<style scoped>
    .sidebar .sidebar-brand {
        text-transform: none;
    }
</style>

