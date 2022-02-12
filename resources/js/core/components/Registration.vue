<template>
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div v-for="error in errors">
                    <error :error="error[0]"></error>
                </div>

                <message :message="message"></message>
                <loading :loading="loading"></loading>

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
                                    <button :disabled="this.loading" type="submit"
                                            class="btn btn-primary btn-user btn-block">
                                        Создать
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Забыли пароль?</a>
                                </div>
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
    import axios from 'axios';

    require('promise.prototype.finally').shim();

    export default {
        name: 'Login',
        data() {
            return {
                loading: false,
                errors: [],
                message: null,

                form: {
                    email: null,
                    password: null,
                    name: null,
                    password_confirmation: null,
                }
            }
        },
        methods: {
            sendForm() {
                this.loading = true;

                axios
                    .post(`api/registration`, this.form)
                    .then(response => {
                        this.errors = [];
                        this.message = "Вы успешно зарегистрировали аккаунт!";
                    })
                    .catch(error => {
                        console.log(error);
                        this.errors = error.response.data.errors || error.message;
                    })
                    .finally(() => this.loading = false);
            }
        }
    }
</script>
