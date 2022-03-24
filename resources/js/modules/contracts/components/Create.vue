<template>
    <div>
        <section class="">
            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                    <li class="breadcrumb-item"><router-link to="/services/index">Услуги</router-link></li>
                    <li class="breadcrumb-item active" aria-current="page">Корзина клиента</li>
                </ol>
            </nav>
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

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="typo__label">Пациент</label>
                                            <multiselect v-model="user" :options="users"
                                                         :close-on-select="false"
                                                         placeholder="Type to search" track-by="full_name" label="full_name">
                                                <span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
                                            </multiselect>

                                        </div>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-primary btn-lg btn-block" :disabled="!isEnabled()" @click="createContract()">
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
    import Service from "../../common/components/Service";
    import Multiselect from "vue-multiselect";

    export default {
        metaInfo: {
            title: 'Корзина Пациента'
        },
        data() {
            return {
                user: null,
            }
        },
        mounted() {
            this.$store.dispatch('getUsers');

            if (this.$route.params.id) {
                this.user = this.users.find(user => user.id === this.$route.params.id)
            }
        },
        computed: {
            ...mapGetters([
                'basketServices',
                'basketSum',
                'isLogged',
                'users',
            ])
        },
        components: {
            Service,
            Multiselect
        },
        methods: {
            createContract() {
                if (this.isLogged) {
                    let basket = {
                        services: this.basketServices,
                        user_id: this.user.id
                    };
                    this.$store.dispatch('createContract', basket);
                }
            },
            isEnabled() {
                return this.isLogged && this.basketServices.length
            }
        }
    }

</script>
