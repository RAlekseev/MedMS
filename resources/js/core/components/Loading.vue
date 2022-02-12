<template>
    <div class="text-center" v-if="loading">
        <div class="spinner-border" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['loading']
    }
</script>
