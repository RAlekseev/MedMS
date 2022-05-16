<template>
    <div class="col-md-8">
        <div class="card mb-3">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    Последние заказы
                </h6>
            </div>
            <div class="card-body">
                    <div class="table-responsive">
                        <table id="data_table" class="table table-bordered" style="width:100%;">
                            <thead>
                            <tr>
                                <th>Номер</th>
                                <th>Создан</th>
                                <th>Название услуги</th>
                                <th>Статус</th>
                                <th>Стоимость</th>
                            </tr>
                            </thead>
                            <tbody>
                            <template v-for="(contract, contract_i) in myContracts.slice(0, 5)">
                                <tr v-for="(service, i) in contract.services" :class="{even: contract_i % 2 === 0}">
                                    <td :rowspan="contract.services.length" v-if="i === 0">
                                        <router-link :hidden="i !== 0" :to="'/contracts/show/' + contract.id">
                                            № {{contract.id}}
                                        </router-link>
                                    </td>

                                    <td :rowspan="contract.services.length" v-if="i === 0">
                                        {{contract.created_at}}
                                    </td>

                                    <td>
                                        {{service.name}}
                                    </td>
                                    <td>
                                        <div class="text-warning">
                                            Оформлено
                                        </div>
                                    </td>
                                    <td>
                                        {{service.price}} {{config_value('currency')}}
                                    </td>
                                </tr>
                            </template>
                            </tbody>
                        </table>
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
                'myContracts',
                'config_value',
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

<style scoped>
    .even {
        background-color: #f2f2f2;
    }
</style>