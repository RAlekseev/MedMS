<template>
    <router-link :to="{name: `services`, params: {id: category.id}}" class="col-xs-12 col-sm-6 col-lg-4 my-3">
        <div class="card p-3  h-100">
            <div class="row h-100">
                <div class="col-2 m-auto">
                    <i class="fa fa-heartbeat fa-3x text-primary"></i>
                </div>
                <div class="col-10 m-auto">
                    <h4>
                        {{category.name}}
                    </h4>
                </div>
            </div>
        </div>
    </router-link>
</template>

<script>
    export default {
        props: ['category']
    }
</script>