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
                                <div  v-if="basketServices.length">
                                <div v-for="service in basketServices" :key="service.id">
                                    <Service :service="service"></Service>
                                </div>
                                </div>
                                <div class="m-auto" v-else>
                                    <h3>Корзина пуста...</h3>
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
                                        <span>{{service.price}} {{config_value('currency')}}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Общая цена</strong>
                                        </div>
                                        <span><strong>{{basketSum}} {{config_value('currency')}}</strong></span>
                                    </li>
                                </ul>

<!--                                <p class="text-gray-400 text-center" v-if="!isLogged">-->
                                <form @submit.prevent="" class="user text-gray-400 text-center" v-if="!isLogged">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <input type="text" v-model="form.last_name" class="form-control form-control-user"
                                                       aria-describedby="emailHelp"
                                                       placeholder="Фамилия..." required>
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" v-model="form.first_name" class="form-control form-control-user"
                                                       aria-describedby="emailHelp"
                                                       placeholder="Имя..." required>
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" v-model="form.middle_name" class="form-control form-control-user"
                                                       aria-describedby="emailHelp"
                                                       placeholder="Отчество...">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="email" v-model="form.email" class="form-control form-control-user"
                                                       aria-describedby="emailHelp"
                                                       placeholder="Email Address..." required>
                                            </div>
                                            <div class="col-sm-6">
                                                <input placeholder="+996(XXX)XXX-XXXX" type="tel" class="form-control form-control-user"
                                                       required v-model="form.phone" v-mask="'+996(###)###-####'">
                                            </div>
                                        </div>
                                    </div>
                                    Для оформления заказа необходимо заплнить данные или
                                    <router-link :to="{name: 'login', query: { redirect: '/basket' }}">
                                        Авторизоваться
                                    </router-link>
                                    <br>
                                    <router-link :to="{name: 'registration'}">
                                        Нет аккаунта?
                                    </router-link>
                                </form>

                                <button type="button" class="btn btn-primary btn-lg btn-block mt-4" :disabled="!isEnabled" @click="createContract()">
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
        data() {
            return {
                form: {
                    email: null,
                    password: null,
                },
            }
        },
        metaInfo: {
            title: 'Корзина',
        },
        computed: {
            ...mapGetters([
                'basketServices',
                'basketSum',
                'isLogged',
                'config_value',
            ]),
            formValidate: function () {
                return this.form.email && this.form.phone && this.form.first_name && this.form.last_name
            },
            isEnabled: function () {
                return this.basketServices.length && (this.isLogged || this.formValidate)
            }
        },
        components: {
            Service
        },
        methods: {
            createContract() {
                if (this.isEnabled) {
                    let basket = {
                        services: this.basketServices,
                    };
                    if (this.formValidate) {
                        basket['user'] = this.form
                    }
                    this.$store.dispatch('createMyContract', basket);
                }
            },
        },
    }

</script>
