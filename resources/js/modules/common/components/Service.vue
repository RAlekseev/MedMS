<template>
    <div class="service_item">
        <div class="row p-1">
            <div class="col-10">
                <h6>
                    <a href="#" class="service-link">
                        {{service.name}}
                    </a>
<!--                    <router-link :to="{name: 'serviceShow', params: {id: service.id}}" class="service-link">-->
<!--                        {{service.name}}-->
<!--                    </router-link>-->
                </h6>
                <p class="text-gray-400 m-0">
                    {{service.category.name}} / Cоздано: {{service.created_at}}
                </p>
            </div>

            <div class="col-2 text-right m-auto p-0 mr-1">
                <button class="btn btn-danger" v-if="isServiceInBasket(service)"
                        @click.prevent="deleteServiceFromBasket(service)">
                    {{service.price}}
                    <i class="fa fa-shopping-bag"></i>
                </button>
                <button class="btn btn-success" v-else @click.prevent="addServiceInBasket(service)">
                    {{service.price}}
                    <i class="fa fa-shopping-bag"></i>
                </button>
            </div>
        </div>
        <hr class="m-2">
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        props: ['service'],
        computed: {
            ...mapGetters([
                'isServiceInBasket',
            ])
        },
        methods: {
            addServiceInBasket(service) {
                this.$store.dispatch('putInBasket', service)
            },
            deleteServiceFromBasket(service) {
                this.$store.dispatch('deleteFromBasket', service.id)
            }
        }
    }
</script>

<style scoped>
    .service-link {
        word-wrap: break-word;
    }
</style>