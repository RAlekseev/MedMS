<template>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Роли
                <Create v-if="can('roles-create')"></Create>
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
                    <tr v-for="role in roles" :key="role.id">
                        <td class="text-center">{{role.id}}</td>
                        <td>
                            <router-link :to="{name: 'roleShow', params: {id: role.id}}" v-if="can('roles-show')">
                                {{role.name}}
                            </router-link>
                            <span v-else>
                                {{role.name}}
                            </span>
                        </td>
                        <td>
                            <span v-for="permission in role.permissions" :key="permission.id">{{permission.slug}} </span>
                        </td>
                        <td>
                            {{role.users.length}}
                        </td>

                        <td class="text-right">
                            <div>
                                <Edit :role="role" v-if="can('roles-update')"></Edit>
                                <Delete :role="role" v-if="can('roles-delete')"></Delete>
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

    export default {
        metaInfo: {
            title: 'Роли'
        },
        computed: {
            ...mapGetters([
                'can',
                'roles',
                'permissions',
            ])
        },
        components: {
            Create,
            Edit,
            Delete,
        },
        mounted() {
            this.$store.dispatch('getRoles');
            this.$store.dispatch('getPermissions');
        },
    }
</script>
