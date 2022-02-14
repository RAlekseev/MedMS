<template>
    <div>
        <div class="col-lg-4">
            <loading v-if="loading"></loading>
            <div v-else class="card shadow mb-4">


                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">
                        {{role.name}}
                        <Edit @update="onUpdate($event)" :initial-role="role" :all-permissions="allPermissions"></Edit>
                    </h6>
                </div>

                <div class="card-body">
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <loading v-if="loading"></loading>
            <div v-else class="card shadow mb-4">


                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">
                        Пользователи
                    </h6>
                </div>

                <div class="card-body">
                    <ul>
                        <li v-for="user in role.users">
                            {{user.name}}
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import axios from 'axios';

    import Edit from './Edit'

    export default {
        data() {
            return {
                loading: true,
                role: null,
                error: null,
                allPermissions: [],
            };
        },
        mounted() {
            this.getRole();
            this.getPermissions();
        },
        components: {
            Edit,
        },
        methods: {
            getRole() {
                axios
                    .get(`/api/roles/${this.$route.params.id}`)
                    .then(response => {
                        this.role = response.data;
                    }).catch(error => {
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            },
            onUpdate(role) {
                this.loading = true;
                axios
                    .patch(`api/roles/${role.id}`, role)
                    .then(response => {
                        this.$store.dispatch('pushMessage', response.data.message);
                    }).catch(error => {
                    this.getUsers();
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                }).finally(() => this.loading = false);
            },
            getPermissions() {
                axios
                    .get('/api/permissions')
                    .then(response => {
                        this.allPermissions = response.data;
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                });
            }
        }
    }
</script>
