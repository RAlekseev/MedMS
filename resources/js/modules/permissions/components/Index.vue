<template>

    <div class="card shadow mb-4">
        <loading v-if="loading"></loading>

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Права доступа
                <Create @create="onCreate($event)"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Код</th>
                        <th class="text-right">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="permissions">
                    <tr v-for="permission in permissions">
                        <td class="text-center">{{permission.id}}</td>
                        <td>
                            <a href="#">
                                {{permission.name}}
                            </a>
                        </td>
                        <td>{{permission.slug}}</td>

                        <td class="text-right">
                            <div>
                                <button @click="deletePermission(permission.id)"
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

    export default {
        data() {
            return {
                loading: true,
                permissions: null,
            };
        },
        components: {
            Create,
        },
        mounted() {
            this.getPermissions();
        },
        methods: {
            getPermissions() {
                axios
                    .get('/api/permissions')
                    .then(response => {
                        this.permissions = response.data;
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                }).finally(() => this.loading = false);
            },
            deletePermission(id) {
                this.loading = true;
                axios
                    .delete(`/api/permissions/${id}`)
                    .then(response => {
                        let index = this.roles.findIndex(permission => permission.id === id);
                        this.permissions.splice(index, 1);
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message);
                }).finally(() => this.loading = false);
            },
            onCreate(permission) {
                this.loading = true;
                axios
                    .post('api/permissions', permission)
                    .then(response => {
                        this.$store.dispatch('pushMessage', response.data.message);
                        this.permissions.push(response.data.permission);
                    }).catch(error => {
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                }).finally(() => this.loading = false);
            },
            onUpdate(permission) {
                this.loading = true;
                axios
                    .patch(`api/permissions/${permission.id}`, permission)
                    .then(response => {
                        this.$store.dispatch('pushMessage', response.data.message);
                    }).catch(error => {
                    this.getUsers();
                    this.$store.dispatch('pushError', error.response.data.message || error.message)
                }).finally(() => this.loading = false);
            }
        },
        computed: {
            ...mapGetters([
                'can',
            ])
        },
    }
</script>
