<template>

    <div class="card shadow mb-4">
        <loading v-if="loading"></loading>

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Роли
                <Create @create="onCreate($event)" :all-permissions="allPermissions"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Права доступа</th>
                        <th>Полльзователи</th>
                        <th class="text-right">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="roles">
                    <tr v-for="role in roles">
                        <td class="text-center">{{role.id}}</td>
                        <td>
                            <router-link :to="{name: 'roleShow', params: {id: role.id}}">
                                {{role.name}}
                            </router-link>
                        </td>
                        <td>
                            <span v-for="permission in role.permissions">{{permission.slug}} </span>
                        </td>
                        <td>
                            {{role.users.length}}
                        </td>

                        <td class="text-right">
                            <div>
                                <Edit @update="onUpdate($event)" :initial-role="role" :all-permissions="allPermissions"></Edit>

                                <button @click="deleteRole(role.id)"
                                        class="btn btn-danger btn-round">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';

    require('promise.prototype.finally').shim();
    import {mapGetters} from 'vuex'

    import Create from "./Create";
    import Edit from "./Edit";

    export default {
        data() {
            return {
                loading: true,
                roles: null,
                allPermissions: null,
            };
        },
        components: {
            Create,
            Edit,
        },
        mounted() {
            this.getRoles();
            this.getPermissions();
        },
        methods: {
            getRoles() {
                axios
                    .get('/api/roles')
                    .then(response => {
                        this.roles = response.data;
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                }).finally(() => this.loading = false);
            },
            deleteRole(id) {
                this.loading = true;
                axios
                    .delete(`/api/roles/${id}`)
                    .then(response => {
                        let index = this.roles.findIndex(role => role.id === id);
                        this.roles.splice(index, 1);
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message);
                }).finally(() => this.loading = false);
            },
            onCreate(role) {
                this.loading = true;
                axios
                    .post('api/roles', role)
                    .then(response => {
                        this.getRoles()
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
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
        },
        computed: {
            ...mapGetters([
                'can',
            ])
        },
    }
</script>
