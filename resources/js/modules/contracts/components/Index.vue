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
                            <table id="data_table" class="display table-bordered" style="width:100%;">
                                <thead>
                                <tr>
                                    <th>Номер</th>
                                    <th>Клиент</th>
                                    <th>Создан</th>
                                    <th>Название услуги</th>
                                    <th>Статус</th>
                                    <th>Стоимость</th>
                                </tr>
                                </thead>
                                <tbody>
                                <template v-for="(contract, contract_i) in contracts" v-if="contracts.length">
                                    <tr v-for="(service, i) in contract.services" :class="contract_i % 2 === 0 ? 'even-contract' : 'odd-contract'">
                                        <td>
                                            <router-link :hidden="i !== 0" :to="'/contracts/show/' + contract.id" :data-order="+contract.id">
                                                № {{contract.id}}
                                            </router-link>
                                        <td>
                                            <router-link :hidden="i !== 0"
                                                    :to="{path: `users/show/${contract.patient.id}`}"
                                                    v-if="can('users-show')">
                                                {{contract.patient.full_name}}
                                            </router-link>
                                            <span v-else :hidden="i !== 0">
                                                {{contract.patient.full_name}}
                                            </span>
                                        </td>
                                        <td>
                                            <span :data-order="contract.created_at + '0'"  v-if="i === 0">
                                                {{contract.created_at}}
                                            </span>
                                            <span :data-order="contract.created_at" hidden v-else>
                                                {{contract.created_at}}
                                            </span>
                                        </td>

                                        <td>

                                            {{service.name}}
                                        </td>
                                        <td>
                                            <div class="text-warning">
                                                Оформлено
                                            </div>
                                        </td>
                                        <td>
                                            {{service.price}} {{config_value('currency')}}
                                        </td>

                                    </tr>
                                </template>
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
                .then(() => {window.$('#data_table').DataTable(dataTableConfig);});
            window.$("#data_table tr").removeClass( "odd even" )
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
            }
        }
    }
</script>

<style scoped>
    .odd-contract {
        background-color: #f2f2f2 !important;
    }
    .even-contract {
        background-color: #fff !important;
    }
    .sorting_1 {
        background-color: transparent!important;
    }
</style>