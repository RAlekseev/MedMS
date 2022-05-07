<template>
    <div>
        <section class="">
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                    <li class="breadcrumb-item"><router-link to="/services/index">Услуги</router-link></li>
                    <li class="breadcrumb-item"><router-link to="/contracts">Оформленные Услуги</router-link></li>
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
                                    <Document v-for="doc_template in doc_templates" :doc_template="doc_template" :key="doc_template.id"/>
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
    import Document from "./Document"

    export default {
        metaInfo: {
            title: 'Просмотр заказа'
        },
        mounted() {
            this.$store.dispatch('getContract', this.$route.params.id);
            this.$store.dispatch('getContractMedia');
        },
        computed: {
            ...mapGetters([
                'contract',
                'doc_templates',
            ])
        },
        components: {
            Document,
        },
    }

</script>
