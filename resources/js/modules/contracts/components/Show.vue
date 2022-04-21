<template>
    <div>
        <section class="">
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                    <li class="breadcrumb-item"><router-link to="/services/index">Услуги</router-link></li>
                    <li class="breadcrumb-item active" aria-current="page">Заказ №{{contract.id}}</li>
                </ol>
            </nav>
            <div class="container">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Корзина</h5>
                            </div>
                            <div class="card-body" v-if="contract.services.length">
                                <!-- Single item -->
                                <div v-for="service in contract.services" :key="service.id">

                                    <div class="service_item">
                                        <div class="row p-1">
                                            <div class="col-10">
                                                <h6>
                                                    <router-link :to="{name: 'serviceShow', params: {id: service.id}}" class="service-link">
                                                        {{service.name}}
                                                    </router-link>
                                                </h6>
                                                <p class="text-gray-400 m-0">
                                                    Дата приема: {{contract.created_at}} / Врач: Имя врача
                                                </p>
                                            </div>

                                            <div class="col-2 text-right m-auto p-0 mr-1">
                                                <div class="text-success">
                                                    <b>
                                                    Пройдено
                                                    </b>
                                                </div>
                                            </div>
                                        </div>
                                        <hr class="m-2">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Документы</h5>
                            </div>

                            <div class="card-body">
                                <ul class="list-group list-group-flush">
<!--                                    <li v-for="service in basketServices" :key="service.id"-->
<!--                                        class="list-group-item d-flex justify-content-between align-items-center  border-0 px-0 pb-0">-->
<!--                                        <div style="max-width: 70%">-->
<!--                                            {{service.name}}-->
<!--                                        </div>-->
<!--                                        <span>{{service.price}} ₽</span>-->
<!--                                    </li>-->
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center  border-0 px-0 pb-0">
                                        <div style="max-width: 70%">
                                            Согласие на обработку данных
                                        </div>
                                        <button class="btn btn-warning">
                                            <i class="fa fa-print"></i>
                                        </button>
                                        <button class="btn btn-success">
                                            <i class="fa fa-upload"></i>
                                        </button>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center  border-0 px-0 pb-0">
                                        <div style="max-width: 70%">
                                            Договор об оказании платных мед услуг
                                        </div>
                                        <button class="btn btn-warning">
                                            <i class="fa fa-print"></i>
                                        </button>
                                        <button class="btn btn-success">
                                            <i class="fa fa-upload"></i>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        metaInfo: {
            title: 'Просмотр заказа'
        },
        data() {
            return {

            }
        },
        mounted() {
            this.$store.dispatch('getContract', this.$route.params.id);
        },
        computed: {
            ...mapGetters([
                'contract',
            ])
        },
        components: {

        },
        methods: {

        }
    }

</script>
