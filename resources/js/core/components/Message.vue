<template>
    <div class="alert alert-success" role="alert" v-if="message">
        <i class="fa fa-exclamation-circle"></i>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <i class="fa fa-times"></i>
        </button>
        <span data-notify="message">
            {{ message }}
        </span>
    </div>
</template>

<script>
    export default {
        props: ['message'],
    }
</script>
