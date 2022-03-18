<template>
    <div class="row justify-content-center mb-lg-5">

        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Создать аккаунт!</h1>
                                </div>
                                <form @submit.prevent="sendForm" class="user">
                                    <div class="form-group">
                                        <input type="text" v-model="form.name" class="form-control form-control-user"
                                               aria-describedby="emailHelp"
                                               placeholder="Введите ваши ФИО..." required>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" v-model="form.email" class="form-control form-control-user"
                                               aria-describedby="emailHelp"
                                               placeholder="Enter Email Address..." required>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <input type="password" v-model="form.password"
                                                       class="form-control form-control-user"
                                                       id="exampleInputPassword" placeholder="Пароль" required>
                                            </div>
                                            <div class="col-lg-6">
                                                <input type="password" v-model="form.password_confirmation"
                                                       class="form-control form-control-user"
                                                       placeholder="Повторите пароль" required>
                                            </div>
                                        </div>
                                    </div>
                                    <button :disabled="loading" type="submit"
                                            class="btn btn-primary btn-user btn-block">
                                        Создать
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <router-link class="small" :to="{name: 'login'}">Уже есть аккаунт!</router-link>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 d-none d-lg-block bg-register-image">
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
        name: 'Registration',
        metaInfo: {
            title: 'Регистрация'
        },
        data() {
            return {
                form: {
                    email: null,
                    password: null,
                    name: null,
                    password_confirmation: null,
                }
            }
        },
        computed: {
            ...mapGetters([
                'loading',
            ])
        },
        methods: {
            sendForm() {
                this.$store.dispatch('registration', this.form);
            }
        }
    }
</script>
