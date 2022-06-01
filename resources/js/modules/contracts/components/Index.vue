<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <router-link to="/">Главная</router-link>
                </li>
                <li class="breadcrumb-item">
                    <router-link to="/services/index">Услуги</router-link>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Оформленные услуги</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Оформленные услуги
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="data_table" class="display table-bordered text-center" style="width:100%;" >
                                <thead>
                                <tr>
                                    <th>Номер</th>
                                    <th>Клиент</th>
                                    <th>Контакты</th>
                                    <th>Создан</th>
                                    <th>Услуги</th>
                                    <th>Статус</th>
                                    <th>Стоимость</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="contract in contracts" v-if="contracts.length" >
                                    <td>
                                        <router-link :to="'/contracts/show/' + contract.id" :data-order="+contract.id" v-if="can('contracts-show')" >
                                            № {{contract.id}}
                                        </router-link>
                                        <b v-else>
                                            № {{contract.id}}
                                        </b>
                                    </td>
                                    <td>
                                        <router-link :to="{path: `users/show/${contract.patient.id}`}"
                                                     v-if="can('users-show')">
                                            {{contract.patient.full_name}}
                                        </router-link>
                                        <span v-else>
                                                {{contract.patient.full_name}}
                                        </span>
                                    </td>
                                    <td>
                                        {{contract.patient.phone}}
                                        <br>
                                        {{contract.patient.email}}
                                    </td>
                                    <td>
                                        <span :data-order="contract.created_at + '0'">
                                            {{contract.created_at}}
                                        </span>
                                    </td>

                                    <td>
                                        <b>{{contract.services.length}}</b>
                                    </td>
                                    <td>
                                        <div class="text-warning">
                                            Оформлено
                                        </div>
                                    </td>
                                    <td>
                                        {{price(contract)}} {{config_value('currency')}}
                                    </td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";

    export default {
        metaInfo: {
            title: 'Оформленные заказы'
        },
        mounted() {
            this.$store.dispatch('getContracts')
                .then(() => {
                    window.$('#data_table').DataTable(dataTableConfig);
                });
        },
        computed: {
            ...mapGetters([
                'contracts',
                'can',
                'config_value',
            ])
        },
        methods: {
            price(contract) {
                return contract.services.reduce(function (sum, service) {
                    return sum + service.price;
                }, 0);
            },
        }
    }
</script>

<style scoped>
    .sorting_1 {
        background-color: transparent !important;
    }
</style>