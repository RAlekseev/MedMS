<template>
    <button @click="deleteWarehouseInventory(inventory.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['inventory'],
        methods: {
            deleteWarehouseInventory(id) {
                this.$store.dispatch('deleteWarehouseInventory', id)
            },
        },
    }
</script>
