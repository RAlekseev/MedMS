<template>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Услуги
                <Create v-if="can('services-create')"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Название</th>
                        <th>Цена</th>
                        <th>Категория</th>
                        <th>Входит</th>
                        <th>Описание</th>
                        <th class="text-right" style="min-width: 100px">Действия</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="service in services" :key="service.id">
                        <td class="text-center">{{service.id}}</td>
                        <td>
                            <router-link :to="{name: 'serviceShow', params: {id: service.id}}" v-if="can('services-show')">
                                {{service.name}}
                            </router-link>
                            <span v-else>
                                {{service.name}}
                            </span>
                        </td>
                        <td>{{service.price}}</td>
                        <td>{{service.category.name}}</td>
                        <td>
                            <ol>
                                <li v-for="child_service in service.child_services" :key="child_service.id">
                                    {{child_service.name}}
                                </li>
                            </ol>
                        </td>
                        <td>{{limitStr(service.description, 30)}}</td>
                        <td class="text-right">
                            <div>
                                <Edit :service="service" v-if="can('services-update')"></Edit>
                                <Delete :service="service" v-if="can('services-delete')"></Delete>
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
            title: 'Управление услугами'
        },
        computed: {
            ...mapGetters([
                'can',
                'services',
                'categories',
            ])
        },
        components: {
            Create,
            Edit,
            Delete,
        },
        mounted() {
            this.$store.dispatch('getServices').then( () => {
                this.$store.dispatch('getCategories').then( () => {
                    window.$('#data_table').DataTable(dataTableConfig);
                });
            });

        },
        methods: {
            limitStr(str, n) {
                return str.substr(0, n) + (str.length > n ? "..." : "");
            },
        }
    }
</script>
