<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <router-link to="/">Главная</router-link>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Аптечный склад</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Аптечный склад
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="data_table" class="display table-bordered" style="width:100%;">
                                <thead>
                                <tr>
                                    <th>Название</th>
                                    <th>Ед.</th>
                                    <th>Количество</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="inventory in inventories">
                                    <td class="text-center">
                                        <router-link :to="{ name: 'inventoryShow', params: { id: inventory.id } }"
                                                     v-if="can('warehouse-show')">
                                            {{inventory.name}}
                                        </router-link>
                                        <span v-else>
                                            {{inventory.name}}
                                        </span>
                                    </td>
                                    <td>
                                        {{inventory.unit}}
                                    </td>
                                    <td>
                                        {{inventory.amount}}
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
    import Income from "./Income";
    import Outcome from "./Outcome";

    export default {
        data() {
            return {
                inventories: [
                    {
                        id: 1,
                        name: 'Адреналин',
                        unit: 'ml',
                        amount: 50,
                    },
                    {
                        id: 2,
                        name: 'Бинт стерильный 10м.',
                        unit: 'Шт',
                        amount: 13,
                    },
                ]
            }
        },
        metaInfo: {
            title: 'Аптечный склад'
        },
        mounted() {
            window.$('#data_table').DataTable(dataTableConfig);
        },
        computed: {
            ...mapGetters([
                'contracts',
                'can',
            ])
        },
        methods: {
            price(contract) {
                return contract.services.reduce(function (sum, service) {
                    return sum + service.price;
                }, 0);
            }
        },
        components: {
            Income,
            Outcome,
        }
    }
</script>