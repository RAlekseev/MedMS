<template>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Права доступа
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
                        <th>Описание</th>
                    </tr>
                    </thead>
                    <tbody v-if="permissions">
                    <tr v-for="permission in permissions" :key="permission.id">
                        <td class="text-center">{{permission.id}}</td>
                        <td>
                            <a href="#">
                                {{permission.name}}
                            </a>
                        </td>
                        <td>{{permission.slug}}</td>
                        <td>{{permission.description}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        name: 'PermissionsIndex',
        metaInfo: {
            title: 'Права доступа'
        },
        computed: {
            ...mapGetters([
                'permissions',
            ])
        },
        mounted() {
            this.$store.dispatch('getPermissions');
        },
    }
</script>
