<template>
    <table :id="'movementsTable' + id" class="display table-bordered" style="width:100%!important;">
        <thead>
        <tr>
            <th>Ответственный</th>
            <th>Объекты</th>
            <th>Контрагент</th>
            <th>Дата</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="movement in movements">
            <td>
                {{movement.creator.full_name}}
            </td>
            <td>
                <div v-for="inventory in movement.inventories" class="">
                    {{inventory.name}}
                    <b :class="{
                    'text-success': inventory.pivot.amount > 0,
                    'text-danger': inventory.pivot.amount < 0
                    }">
                    {{Math.abs(inventory.pivot.amount)}}
                    {{inventory.unit}}
                    </b>
                    <hr>
                </div>

            </td>
            <td>
                {{movement.contractor}}
            </td>
            <td>
                {{movement.created_at}}
            </td>
        </tr>
        </tbody>
    </table>
</template>

<script>
    import {mapGetters} from "vuex";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";

    export default {
        props: ['movements', 'id'],
        mounted() {
            window.$('#movementsTable' + this.id).DataTable(dataTableConfig);
        },
        computed: {
            ...mapGetters([
                'inventories',
            ])
        },
    }
</script>