<template>
    <button @click="deleteDocTemplate(doc_template.id)" class="btn btn-danger btn-round">
        <i class="fa fa-trash"></i>
    </button>
</template>

<script>
    export default {
        props: ['doc_template'],
        methods: {
            deleteDocTemplate(id) {
                this.$store.dispatch('deleteDocTemplate', id)
            },
        },
    }
</script>
