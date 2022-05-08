<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item"><router-link to="/warehouse">Аптечный склад</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Передвижения</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Приходы/Расходы склада
                        </h6>
                    </div>
                    <div class="card-body">
                        <MovementsTable :movements="movements"/>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import MovementsTable from "./MovementsTable";

    export default {
        data() {
            return {
                movements: [
                    {
                        contractor: "КДО СМП",
                        amount: -20,
                        inventory_id: 1,
                        date: '18.04.2022',
                    },
                    {
                        contractor: "КДО СМП",
                        amount: -3,
                        inventory_id: 1,
                        date: '19.04.2022',
                    },
                    {
                        contractor: "ОсОО Радуга",
                        amount: 25,
                        inventory_id: 2,
                        date: '15.04.2022',
                    },
                ],
            }
        },
        metaInfo: {
            title: 'Передвижения'
        },
        mounted() {
            // this.$store.dispatch('getInventories')
            // this.$store.dispatch('getMovements')
        },
        computed: {
            // ...mapGetters([
            //     'movements',
            // ])
        },
        components: {
            MovementsTable
        }
    }
</script>