<template>

    <div class="card shadow mb-4">
        <error :error="error"></error>
        <message :message="message"></message>
        <loading :loading="loading"></loading>

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Пользователи
                <Create @create="onCreateUser($event)"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Почта</th>
                        <th class="text-right">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="users">
                    <tr v-for="user in users">
                        <td class="text-center">{{user.id}}</td>
                        <td>
                            <a href="#">
                                {{user.name}}
                            </a>
                        </td>
                        <td>{{user.email}}</td>

                        <td class="text-right">
                            <div>
                                <router-link :to="{ name: 'usersShow', params: { id: user.id } }">
                                    <button class="btn btn-success btn-round">
                                        <i class="fa fa-eye"></i>
                                    </button>
                                </router-link>

                                <button @click="changePass(user.id)" class="btn btn-warning btn-round">
                                    <i class="fa fa-key"></i>
                                </button>

                                <Edit @update="onUpdateUser($event)" :initialUser="user"></Edit>

                                <button @click="deleteUser(user.id)"
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

    import Create from "./Create";
    import Edit from "./Edit";

    export default {
        data() {
            return {
                loading: true,
                users: null,
                error: null,
                message: null,
            };
        },
        components: {
            Create,
            Edit,
        },
        mounted() {
            this.getUsers();
            console.log(this.users);
        },
        methods: {
            getUsers() {
                axios
                    .get('/api/users')
                    .then(response => {
                        this.users = response.data;
                    }).catch(error => {
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            },
            deleteUser(id) {
                this.loading = true;
                axios
                    .delete(`/api/users/${id}`)
                    .then(response => {
                        let index = this.users.findIndex(user => user.id === id);
                        this.users.splice(index, 1);
                    }).catch(error => {
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            },
            changePass(id) {
                this.loading = true;
                axios
                    .get(`/api/users/change_pass/${id}`)
                    .then(response => {
                        this.message = response.data;
                    }).catch(error => {
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            },
            onCreateUser(user) {
                this.loading = true;
                axios
                    .post('api/users', user)
                    .then(response => {
                        this.message = response.data.message;
                        this.users.push(response.data.user);
                    }).catch(error => {
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            },
            onUpdateUser(user) {
                this.loading = true;
                axios
                    .patch(`api/users/${user.id}`, user)
                    .then(response => {
                        this.message = response.data.message;
                    }).catch(error => {
                    this.getUsers();
                    this.error = error.response.data.message || error.message;
                }).finally(() => this.loading = false);
            }
        }
    }
</script>
