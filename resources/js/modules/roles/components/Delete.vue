<template>
    <button @click="deleteRole(role.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['role'],
        methods: {
            deleteRole(id) {
                this.$store.dispatch('deleteRole', id)
            },
        },
    }
</script>
