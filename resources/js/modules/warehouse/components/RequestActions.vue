<template>
    <span>
    <button @click="applyWarehouseRequest(warehouse_request.id)"
            class="btn btn-success btn-round" title="Одобрить"
            v-if="warehouse_request.status_id != 2 && can('warehouse-requests-apply')"
    >
        <i class="fa fa-check-square"></i>
    </button>
    <button @click="rejectWarehouseRequest(warehouse_request.id)"
            class="btn btn-warning btn-round" title="Отклонить"
            v-if="warehouse_request.status_id == 1 && can('warehouse-requests-reject')"
    >
        <i class="fa fa-window-close"></i>
    </button>
    <button @click="deleteWarehouseRequest(warehouse_request.id)"
            class="btn btn-danger btn-round" title="Удалить"
            v-if="can('warehouse-requests-delete')"
    >
        <i class="fa fa-trash"></i>
    </button>
    </span>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        props: ['warehouse_request'],
        methods: {
            applyWarehouseRequest(id) {
                this.$store.dispatch('updateWarehouseRequest', {id: id, status_id: 2})
                    .then(() => {this.warehouse_request.status_id = 2})
            },
            rejectWarehouseRequest(id) {
                this.$store.dispatch('updateWarehouseRequest', {id: id, status_id: 3})
                    .then(() => {this.warehouse_request.status_id = 3})
            },
            deleteWarehouseRequest(id) {
                this.$store.dispatch('deleteWarehouseRequest', id)
            },
        },
        computed: {
            ...mapGetters([
                'can',
            ]),
        },
    }
</script>
