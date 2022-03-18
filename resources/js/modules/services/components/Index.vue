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
                        <th>Входящие услуги</th>
                        <th class="text-right">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="services">
                    <tr v-for="service in services" :key="service.id">
                        <td class="text-center">{{service.id}}</td>
                        <td>
                            <router-link :to="{name: 'servicesShow', params: {id: service.id}}" v-if="can('services-show')">
                                {{service.name}}
                            </router-link>
                            <span v-else>
                                {{service.name}}
                            </span>
                        </td>
                        <td>
                            <b>{{service.price}}</b>
                        </td>
                        <td>
<!--                            <span v-for="permission in role.permissions">{{permission.slug}} </span>-->
                        </td>

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

    export default {
        metaInfo: {
            title: 'Услуги'
        },
        computed: {
            ...mapGetters([
                'can',
                'services',
            ])
        },
        components: {
            Create,
            Edit,
            Delete,
        },
        mounted() {
            this.$store.dispatch('getServices');
        },

    }
</script>
