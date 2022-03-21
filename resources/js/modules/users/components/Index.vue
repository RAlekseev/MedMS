<template>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Пользователи
                <Create v-if="can('users-create')"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;" >
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Почта</th>
                        <th>Телефон</th>
                        <th>Дата рождения</th>
                        <th class="text-right" v-if="is_available_actions()">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="users">
                    <tr v-for="user in users" :key="user.id">
                        <td class="text-center">{{user.id}}</td>
                        <td>
                            <router-link :to="{name: 'usersShow', params: {id: user.id}}" v-if="can('users-show')">
                                {{user.full_name}}
                            </router-link>
                            <span v-else>
                                {{user.full_name}}
                            </span>
                        </td>
                        <td>{{user.email}}</td>
                        <td>{{user.phone}}</td>
                        <td>{{user.birthday}}</td>

                        <td class="text-right" v-if="is_available_actions()">
                            <div>
                                <Edit :user="user" v-if="can('users-update')"></Edit>
                                <Delete :user="user" v-if="can('users-delete')"></Delete>
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
    import {mapGetters} from 'vuex'

    import Create from "./Create";
    import Edit from "./Edit";
    import Delete from "./Delete";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";

    export default {
        metaInfo: {
            title: 'Пользователи'
        },
        computed: {
            ...mapGetters([
                'users',
                'can',
            ])
        },
        components: {
            Create,
            Edit,
            Delete
        },
        mounted() {
            this.$store.dispatch('getUsers').then( () => {
                window.$('#data_table').DataTable(dataTableConfig);
            });
        },
        methods: {
            is_available_actions() {
                return this.can('users-update') || this.can('users-delete');
            }
        }
    }
</script>
