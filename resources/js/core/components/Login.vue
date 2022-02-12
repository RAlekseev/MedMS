<template>
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">

                <div v-for="error in errors">
                    <error :error="error"></error>
                </div>

                <message :message="message"></message>
                <loading :loading="loading"></loading>

                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Добро пожаловать!</h1>
                                </div>
                                <form @submit.prevent="sendForm" class="user">
                                    <div class="form-group">
                                        <input type="email" v-model="form.email" class="form-control form-control-user"
                                               id="exampleInputEmail" aria-describedby="emailHelp"
                                               placeholder="Enter Email Address..." required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" v-model="form.password" class="form-control form-control-user"
                                               id="exampleInputPassword" placeholder="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">Remember
                                                Me</label>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        Войти
                                    </button>
<!--                                    <hr>-->
<!--                                    <a href="index.html" class="btn btn-google btn-user btn-block">-->
<!--                                        <i class="fab fa-google fa-fw"></i> Login with Google-->
<!--                                    </a>-->
<!--                                    <a href="index.html" class="btn btn-facebook btn-user btn-block">-->
<!--                                        <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook-->
<!--                                    </a>-->
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Забыли пароль?</a>
                                </div>
                                <div class="text-center">
                                    <router-link class="small" :to="{name: 'registration'}">Создать аккаунт!</router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
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
                }
            }
        },
        methods: {
            sendForm() {
                this.loading = true;
                this.$store
                    .dispatch('login', {
                        email: this.form.email,
                        password: this.form.password
                    })
                    .then(() => {
                        this.$router.push({ name: 'home' })
                    })
                    .catch(error => {
                        this.errors.push(error.response.data.message || error.message);
                    });
                this.loading = false;
            },
        }
    }
</script>

