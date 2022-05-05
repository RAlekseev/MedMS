<template>
    <i class="text-danger fa fa-trash" @click="deleteCategory(category.id)"></i>
</template>

<script>
    export default {
        props: ['category'],
        methods: {
            deleteCategory(id) {
                this.$store.dispatch('deleteCategory', id)
            },
        },
    }
</script>
