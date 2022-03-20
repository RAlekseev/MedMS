<template>
    <button @click="deleteService(service.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['service'],
        methods: {
            deleteService(id) {
                this.$store.dispatch('deleteService', id)
            },
        },
    }
</script>
