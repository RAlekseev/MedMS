<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Профиль</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <ProfileCard :user="authUser"></ProfileCard>
            <LastContracts :user="authUser"></LastContracts>
        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import ProfileCard from "./ProfileCard";
    import LastContracts from "./LastContracts";

    export default {
        metaInfo: {
            title: 'Профиль'
        },
        computed: {
            ...mapGetters([
                'authUser'
            ])
        },
        components: {
            ProfileCard,
            LastContracts,
        }
    }
</script>