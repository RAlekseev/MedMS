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

                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        metaInfo: {
            title: 'Оформленные заказы'
        },
        mounted() {
            this.$store.dispatch('getContracts')
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
        }
    }
</script>