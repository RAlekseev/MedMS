<template>
    <table :id="'movementsTable' + id" class="display table-bordered" style="width:100%!important;">
        <thead>
        <tr>
            <th>Название</th>
            <th>Ед.</th>
            <th>Количество</th>
            <th>Контрагент</th>
            <th>Дата</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="movement in movements" :title="movement.amount > 0 ? 'Приход' : 'Расход'">
            <td class>
                {{inventory(movement.inventory_id).name}}
            </td>
            <td class>
                {{inventory(movement.inventory_id).unit}}
            </td>
            <td>
                <i :class="{'fa': true,
                'text-success fa-plus': movement.amount > 0,
                'text-danger fa-minus': movement.amount < 0}"
                />
                {{Math.abs(movement.amount)}}
            </td>
            <td>
                {{movement.contractor}}
            </td>
            <td>
                {{movement.date}}
            </td>
        </tr>
        </tbody>
    </table>
</template>

<script>
    import {mapGetters} from "vuex";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";

    export default {
        data() {
            return {
                inventories: [
                    {
                        id: 1,
                        name: 'Адреналин',
                        unit: 'ml',
                        amount: 50,
                    },
                    {
                        id: 2,
                        name: 'Бинт стерильный 10м.',
                        unit: 'Шт',
                        amount: 13,
                    },
                ]
            }
        },
        props: ['movements', 'id'],
        mounted() {
            window.$('#movementsTable' + this.id).DataTable(dataTableConfig);
        },
        computed: {
            ...mapGetters([
                // 'inventories',
            ])
        },
        methods: {
            inventory(inventory_id) {
                return this.inventories.find(inventory => inventory.id === inventory_id)
            }
        },
    }
</script>