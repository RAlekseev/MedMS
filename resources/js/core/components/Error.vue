<template>
    <div class="alert alert-danger" role="alert" v-if="error">
        <i class="fa fa-exclamation-circle"></i>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="fa fa-times"></i>
        </button>
        <span data-notify="message">
            {{ error }}
        </span>
    </div>
</template>

<script>
    export default {
        data() {
            return {

            }
        },
        props: ['error'],
    }
</script>
