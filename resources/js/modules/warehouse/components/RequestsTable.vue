<template>
    <table id="warehouse_requests" class="display table-bordered" style="width:100%!important;">
        <thead>
        <tr>
            <th>Создатель</th>
            <th>Запрашивает</th>
            <th>Статус</th>
            <th>Дата создания</th>
<!--            <th>Действия</th>-->
        </tr>
        </thead>
        <tbody>
        <tr v-for="warehouse_request in warehouse_requests">
            <td>
                {{warehouse_request.creator.full_name}}
            </td>
            <td>
                <ul>
                    <li v-for="inventory in warehouse_request.inventories">
                        {{inventory.name}}: <b>{{inventory.amount}}</b>
                    </li>
                </ul>
            </td>
            <td>
                <b :class="status(warehouse_request.status_id).text_class">
                    {{status(warehouse_request.status_id).text}}
                </b>
            </td>
            <td>
                {{warehouse_request.created_at}}
            </td>
        </tr>
        </tbody>
    </table>
</template>

<script>
    // import {mapGetters} from "vuex";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";

    export default {
        data() {
            return {
                statuses: [
                    {id: 1, text: 'Создано', text_class: 'text-warning'},
                    {id: 2, text: 'Одобрено', text_class: 'text-success'},
                    {id: 3, text: 'Отклонено', text_class: 'text-danger'},
                ]
            }
        },
        props: ['warehouse_requests'],
        mounted() {
            window.$('#warehouse_requests').DataTable(dataTableConfig);
        },
        methods: {
            status(status_id) {
                console.log(this.statuses.find(status => status.id == status_id))
                return this.statuses.find(status => status.id == status_id)
            }
        }
        // computed: {
        //     ...mapGetters([
        //         'inventories',
        //     ])
        // },
    }
</script>