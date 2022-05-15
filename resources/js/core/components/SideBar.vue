<template>
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <router-link class="sidebar-brand d-flex align-items-center justify-content-center"
                     :to="{ name: 'home' }">

            <div class="sidebar-brand-icon">
                <img src="/storage/light_logo.png" alt="alt" height="50"
                     onError="this.onerror=null;this.src='/assets/img/light_logo.png';"/>
                <!--                <i class="fas fa-heartbeat"></i>-->
            </div>
            <div class="sidebar-brand-text mx-3">
                <!--                MedMS<sup>1</sup>-->
                {{config_value('org_name')}}
            </div>
        </router-link>


        <!--        <hr class="sidebar-divider my-0">-->

        <li class="nav-item active">
            <router-link class="nav-link" to="/dashboard" v-if="can('dashboard')">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Панель управления</span></router-link>
        </li>

        <div v-if="can('permissions-index', 'roles-index', 'users-index')">
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Контроль пользователей
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Доступ</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Доступ:</h6>
                        <router-link v-if="can('roles-index')" class="collapse-item" :to="{name: 'rolesIndex'}">Роли
                        </router-link>
                        <router-link v-if="can('permissions-index')" class="collapse-item"
                                     :to="{name: 'permissionsIndex'}">
                            Права доступа
                        </router-link>

                    </div>
                </div>
            </li>

            <li class="nav-item">
                <router-link v-if="can('users-index')" class="nav-link" :to="{ name: 'usersIndex' }">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Пользователи</span>
                </router-link>
            </li>
        </div>


        <div v-if="can('contracts-index', 'contracts-create', 'categories-index', 'services-index')">
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Услуги
            </div>

            <li class="nav-item">
                <router-link v-if="can('services-index')" class="nav-link" :to="{ name: 'servicesIndex' }">
                    <i class="fas fa-fw fa-medkit"></i>
                    <span>Список услуг</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link v-if="can('categories-index')" class="nav-link" to="/categories">
                    <!--                <i class="fa-fw fa-duotone fa-layer-group"></i>-->
                    <i class="fas fa-fw fa-layer-group"></i>
                    <span>Категории услуг</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link v-if="can('contracts-create')" class="nav-link" to="/contracts/create">
                    <i class="fas fa-fw fa-check-square"></i>
                    <span>Корзина клиента</span>
                </router-link>
            </li>

            <li class="nav-item">
                <router-link v-if="can('contracts-index')" class="nav-link" to="/contracts">
                    <i class="fas fa-fw fa-list"></i>
                    <span>Оформленные услуги</span>
                </router-link>
            </li>
        </div>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <div class="sidebar-heading">
            Личный кабинет
        </div>

        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'profile' }">
                <i class="fas fa-fw fa-user"></i>
                <span>Профиль</span>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'profileContracts' }">
                <i class="fas fa-fw fa-shopping-basket"></i>
                <span>Мои заказы</span>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'profileBonusCard' }">
                <i class="fas fa-fw  fa-credit-card"></i>
                <span>Мои бонусы</span>
            </router-link>
        </li>

        <div v-if="can('schedules-create')">
            <hr class="sidebar-divider d-none d-md-block">
            <div class="sidebar-heading">
                Сотрудники
            </div>

            <!--        <li class="nav-item">-->
            <!--            <router-link class="nav-link" to="/settings">-->
            <!--                <i class="fas fa-fw fa-users"></i>-->
            <!--                <span>Список сотрудников</span>-->
            <!--            </router-link>-->
            <!--        </li>-->
            <li v-if="can('schedules-index')" class="nav-item">
                <router-link class="nav-link" :to="{ name: 'schedulesIndex' }">
                    <i class="fas fa-fw fa-calendar"></i>
                    <span>Расписание</span>
                </router-link>
            </li>
        </div>

        <div v-if="can('settings-index', 'doc-templates-index', 'icons-index')">
            <hr class="sidebar-divider d-none d-md-block">
            <div class="sidebar-heading">
                Другое
            </div>
            <li class="nav-item">
                <router-link v-if="can('settings-index')" class="nav-link" to="/settings">
                    <i class="fas fa-fw fa-cogs"></i>
                    <span>Настройки</span>
                </router-link>
            </li>
            <li class="nav-item">
                <router-link v-if="can('doc-templates-index')" class="nav-link" to="/doc_templates">
                    <i class="fas fa-fw fa-file"></i>
                    <span>Шаблоны документов</span>
                </router-link>
            </li>
            <li class="nav-item">
                <router-link v-if="can('icons-index')" class="nav-link" to="/icons">
                    <i class="fas fa-fw fa-images"></i>
                    <span>Иконки</span>
                </router-link>
            </li>
        </div>

        <div v-if="can('warehouse-index', 'warehouse-movements')">
            <hr class="sidebar-divider d-none d-md-block">
            <div class="sidebar-heading">
                Склад
            </div>

            <li class="nav-item">
                <router-link v-if="can('warehouse-index')" class="nav-link" to="/warehouse">
                    <i class="fas fa-fw fa-pills"></i>
                    <span>Аптечный склад</span>
                </router-link>
                <router-link v-if="can('warehouse-movements')" class="nav-link" to="/warehouse/movements">
                    <i class="fas fa-fw fa-share-square"></i>
                    <span>Передвижения</span>
                </router-link>
            </li>
        </div>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
</template>

<script>
    import {mapGetters} from "vuex"

    export default {
        computed: {
            ...mapGetters([
                'config_value',
                'can',
            ])
        }
    }
</script>

<style scoped>
    .sidebar .sidebar-brand {
        text-transform: none;
    }
</style>
