<template>
    <button @click="deleteUser(user.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['user'],
        methods: {
            deleteUser(id) {
                this.$store.dispatch('deleteUser', id)
            },
        },
    }
</script>
