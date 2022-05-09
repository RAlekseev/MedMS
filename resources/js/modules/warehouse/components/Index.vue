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
                            <Income/>
                            <Outcome/>
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
                                    <th>Передвижения</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="inventory in inventories">
                                    <td>
                                        {{inventory.name}}
                                    </td>
                                    <td>
                                        {{inventory.unit}}
                                    </td>
                                    <td>
                                        {{inventory.amount}}
                                    </td>
                                    <td>
                                        {{inventory.movements.length}}
                                        <button class="btn btn-success btn-round" data-toggle="modal" :data-target="'#movements'+inventory.id">
                                            <i class="fa fa-eye"></i>
                                        </button>

                                        <div class="modal fade" :id="'movements'+inventory.id" tabindex="-1" role="dialog" aria-labelledby="movementsLabel"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Передвижения <b>{{inventory.name}}</b></h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                            <i class="fa fa-times"></i>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <MovementsTable :movements="inventory.movements" :id="inventory.id"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
    import MovementsTable from "./MovementsTable";

    export default {
        metaInfo: {
            title: 'Аптечный склад'
        },
        mounted() {
            this.$store.dispatch('getInventories')
                .then(() => {window.$('#data_table').DataTable(dataTableConfig)});
        },
        computed: {
            ...mapGetters([
                'inventories',
                'can',
            ]),
        },
        components: {
            Income,
            Outcome,
            MovementsTable,
        }
    }
</script>