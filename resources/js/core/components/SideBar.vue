<template>
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <router-link class="sidebar-brand d-flex align-items-center justify-content-center" :to="{ name: 'home' }">

            <div class="sidebar-brand-icon">
                <i class="fas fa-heartbeat"></i>
            </div>
            <div class="sidebar-brand-text mx-3">MedMS<sup>1</sup></div>
        </router-link>


        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
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
                    <router-link class="collapse-item" :to="{name: 'rolesIndex'}">Роли</router-link>
                    <router-link class="collapse-item" :to="{name: 'permissionsIndex'}">Права доступа</router-link>

                </div>
            </div>
        </li>


        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'usersIndex' }">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Пользователи</span>
            </router-link>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Услуги
        </div>

        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'servicesIndex' }">
                <i class="fas fa-fw fa-medkit"></i>
                <span>Список услуг</span>
            </router-link>
        </li>
        <li class="nav-item">
            <router-link class="nav-link" :to="{ name: 'schedulesIndex' }">
                <i class="fas fa-fw fa-calendar"></i>
                <span>Расписание</span>
            </router-link>
        </li>



        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
</template>

<style scoped>
    .sidebar .sidebar-brand {
        text-transform: none;
    }
</style>
