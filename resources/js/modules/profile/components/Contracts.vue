<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item"><router-link to="/profile">Профиль</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Мои услуги</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Мои заказы
                        </h6>
                    </div>
                    <div class="card-body">
                        <div v-for="contract in myContracts" :key="contract.id" v-if="myContracts.length">
                            <div class="row">
                                <div class="col-sm-3 pl-4">
                                    <h6 class="mb-0">
                                        № {{contract.id}}
                                    </h6>
                                </div>
                                <div class="col-sm-3 text-secondary">
                                    {{contract.created_at}}
                                </div>
                                <div class="col-sm-3 text-secondary text-success">
                                    Оплачено
                                </div>
                                <div class="col-sm-3 text-secondary">
                                    {{price(contract)}}
                                </div>
                            </div>

                            <div class="row" v-for="service in contract.services" :key="service.id" v-if="contract.services.length">
                                <div class="col-sm-3 pl-4">

                                </div>
                                <div class="col-sm-3 text-secondary">
                                    {{service.name}}
                                </div>
                                <div class="col-sm-3 text-secondary text-success">
                                    Оплачено
                                </div>
                                <div class="col-sm-3 text-secondary">
                                    {{service.price}}
                                </div>
                            </div>
                            <hr>
                        </div>

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
            title: 'Мои заказы'
        },
        mounted() {
            this.$store.dispatch('getMyContracts')
        },
        computed: {
            ...mapGetters([
                'myContracts'
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