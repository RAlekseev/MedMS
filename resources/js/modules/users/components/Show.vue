<template>
    <div>
        <div class="card shadow mb-4">
            <div class="alert alert-danger" role="alert" v-if="error">
                {{ error }}
            </div>
            <div class="text-center" v-if="loading">
                <div class="spinner-border" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <div v-if="user">
                <div class="col-md-4">
                    <div class="card card-profile">
                        <div class="card-avatar">
                            <a href="#">
                                <img src="/ddsd" alt="Photo">
                            </a>
                        </div>
                        <div class="card-body">
                            <h6 class="card-category text-gray">
                                Роль: role</h6>
                            <h4 class="card-title">{{user.name}}</h4>
                            <p class="card-description">
                                <a href="#">
                                    Group
                                </a>
                                <a href="#">
                                    Spec
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        data() {
            return {
                loading: true,
                user: null,
                error: null,
            };
        },
        mounted() {
            this.getUser();
        },
        methods: {
            getUser() {
                axios
                    .get(`/api/users/${this.$route.params.id}`)
                    .then(response => {
                        console.log(response.data)
                        this.user = response.data;
                    }).catch(error => {
                        this.error = error.response.data.message || error.message;
                        this.loading = false;
                    }).finally(() => this.loading = false);

            },
        }
    }
</script>
