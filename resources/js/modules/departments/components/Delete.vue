<template>
    <button @click="deleteDepartment(department.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['department'],
        methods: {
            deleteDepartment(id) {
                this.$store.dispatch('deleteDepartment', id)
            },
        },
    }
</script>
