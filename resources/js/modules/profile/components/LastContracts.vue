<template>
    <div class="col-md-8">
        <div class="card mb-3">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    Последние заказы
                </h6>
            </div>
            <div class="card-body">
                <div v-for="contract in myContracts" :key="contract.id" v-if="myContracts.length">
                    <div class="row">
                        <div class="col-sm-3 pl-4">
                            <h6 class="mb-0">
                                № {{contract.id}}
                            </h6>
                        </div>
                        <div class="col-sm-3 text-secondary">
                            {{contract.created_at}}
                        </div>
                        <div class="col-sm-3 text-secondary text-success">
                            Оплачено
                        </div>
                        <div class="col-sm-3 text-secondary">
                            {{price(contract)}}
                        </div>
                    </div>
                    <hr>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        mounted() {
            this.$store.dispatch('getMyContracts')
        },
        computed: {
            ...mapGetters([
                'myContracts'
            ])
        },
        methods: {
            price(contract) {
                return contract.services.reduce(function (sum, service) {
                    return sum + service.price;
                }, 0);
            }
        }
    }
</script>