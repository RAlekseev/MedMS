<template>
    <table id="warehouse_requests" class="display table-bordered" style="width:100%!important;">
        <thead>
        <tr>
            <th>Создатель</th>
            <th>Запрашивает</th>
            <th>Статус</th>
            <th>Комментарий</th>
            <th>Создано</th>
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
                        {{inventory.name}}: <b>{{inventory.pivot.amount}}</b>
                    </li>
                </ul>
            </td>
            <td>
                <b :class="status(warehouse_request.status_id).text_class">
                    {{status(warehouse_request.status_id).text}}
                </b>
            </td>
            <td>
                {{warehouse_request.comment}}
            </td>
            <td>
                <span :data-order="warehouse_request.created_at">
                    {{format_date(warehouse_request.created_at)}}
                </span>
            </td>
        </tr>
        </tbody>
    </table>
</template>

<script>
    import dataTableConfig from "../../../core/utils/DataTablesConfig";
    import moment from 'moment'


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
                return this.statuses.find(status => status.id == status_id)
            },
            format_date(value){
                if (value) {
                    return moment(String(value)).format('DD.MM.YY HH:MM')
                }
            },
        }
    }
</script>