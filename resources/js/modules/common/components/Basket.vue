<template>
    <div>
        <section class="h-100 bg-gradient-light">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4">
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Корзина</h5>
                            </div>
                            <div class="card-body">
                                <!-- Single item -->
                                <div v-for="service in basketServices" :key="service.id">
                                    <Service :service="service"></Service>
                                </div>
                            </div>
                        </div>

<!--                        <div class="card mb-4 mb-lg-0">-->
<!--                            <div class="card-body">-->
<!--                                <p><strong>Мы принимаем</strong></p>-->
<!--                                <img class="me-2" width="45px"-->
<!--                                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"-->
<!--                                     alt="Visa"/>-->
<!--                                <img class="me-2" width="45px"-->
<!--                                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"-->
<!--                                     alt="American Express"/>-->
<!--                                <img class="me-2" width="45px"-->
<!--                                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"-->

<!--                            </div>-->
<!--                        </div>-->
                    </div>
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">К оплате</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li v-for="service in basketServices" :key="service.id"
                                        class="list-group-item d-flex justify-content-between align-items-center  border-0 px-0 pb-0">
                                        <div style="max-width: 70%">
                                            {{service.name}}
                                        </div>
                                        <span>{{service.price}} ₽</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Общая цена</strong>
                                        </div>
                                        <span><strong>{{basketSum}} ₽</strong></span>
                                    </li>
                                </ul>

                                <p class="text-gray-400 text-center" v-if="!isLogged">
                                    Для оформления заказа необходимо
                                    <router-link :to="{name: 'login', query: { redirect: '/basket' }}">
                                        Авторизоваться
                                    </router-link>
                                    <br>
                                    <router-link :to="{name: 'registration'}">
                                        Нет аккаунта?
                                    </router-link>
                                </p>
                                <button type="button" class="btn btn-primary btn-lg btn-block" :disabled="!isLogged" @click="createContract()">
                                    Оформить заказ
                                </button>
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
    import Service from "./Service";

    export default {
        metaInfo: {
            title: 'Корзина'
        },
        computed: {
            ...mapGetters([
                'basketServices',
                'basketSum',
                'isLogged',
            ])
        },
        components: {
            Service
        },
        methods: {
            createContract() {
                if (this.isLogged) {
                    let basket = {
                        services: this.basketServices,
                    };
                    this.$store.dispatch('createContract', basket);
                }
            }
        }
    }

</script>
