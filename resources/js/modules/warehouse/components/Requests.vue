<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item" v-if="can('warehouse-index')"><router-link to="/warehouse">Аптечный склад</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Запросы</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Запросы
                        </h6>
                    </div>
                    <div class="card-body">
                        <RequestsTable :warehouse_requests="warehouse_requests"/>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import RequestsTable from "./RequestsTable";

    export default {
        metaInfo: {
            title: 'Запросы'
        },
        mounted() {
            this.$store.dispatch('getWarehouseRequests')
        },
        computed: {
            ...mapGetters([
                'warehouse_requests',
                'can',
            ])
        },
        components: {
            RequestsTable,
        }
    }
</script>