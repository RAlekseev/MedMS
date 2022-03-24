<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item"><router-link to="/services/index">Услуги</router-link></li>
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
                        <div v-for="contract in contracts" :key="contract.id" v-if="contracts.length">
                            <div class="row">
                                <div class="col-sm-3 pl-4">
                                    <h6 class="mb-0">
                                        № {{contract.id}}
                                    </h6>
                                </div>
                                <div class="col-sm-3 text-secondary">
                                    <router-link :to="{path: `users/show/${contract.patient.id}`}" v-if="can('users-show')">
                                        {{contract.patient.full_name}}
                                    </router-link>
                                    <span v-else>
                                    {{contract.patient.full_name}}
                                    </span>
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
                                    Пройдено
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