<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item"><router-link to="/users">Пользователи</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">{{user.full_name}}</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <ProfileCard :user="user"></ProfileCard>
        </div>

    </div>
</template>

<script>
    import ProfileCard from "../../profile/components/ProfileCard";
    import LastContracts from "../../profile/components/LastContracts";
    import {mapGetters} from "vuex";

    export default {
        mounted() {
            this.$store.dispatch('getUser', this.$route.params.id);
        },
        computed: {
            ...mapGetters(['user'])
        },
        components: {
            ProfileCard,
        }
    }
</script>
