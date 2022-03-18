<template>
    <div v-if="role">
        <div class="col-lg-4">
            <div class="card shadow mb-4">


                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">
                        {{role.name}}
                        <Edit @update="onUpdate($event)" :role="role"></Edit>
                    </h6>
                </div>

                <div class="card-body">
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow mb-4">


                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">
                        Пользователи
                    </h6>
                </div>

                <div class="card-body">
                    <ul>
                        <li v-for="user in role.users" :key="user.id">
                            {{user.name}}
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import Edit from './Edit'
    import {mapGetters} from "vuex";

    export default {
        computed: {
            ...mapGetters([
                'role',
                'permissions',
            ])
        },
        mounted() {
            this.$store.dispatch('getRole', this.$route.params.id);
            this.$store.dispatch('getPermissions');
        },
        components: {
            Edit,
        },
    }
</script>
