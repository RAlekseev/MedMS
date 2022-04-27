<template>
    <div>
        <div class="row m-3" v-for="category in categories" :key="category.id">
            <div class="row my-3 mx-auto">
                <div class="col-2 p-0 text-right">
                    <i class="fa fa-heartbeat fa-2x"></i>
                </div>
                <div class="col-10 m-auto">
                    <h4>
                        <h2 class="">{{category.name}}</h2>
                    </h4>
                </div>
            </div>

            <div class="row m-3">
                <Category v-for="sub_category in category.sub_categories"
                          :category="sub_category"
                          :key="sub_category.id"/>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Category from "./Category";

    export default {
        data() {
            return {}
        },
        mounted() {
            this.$store.dispatch('getGuestServicesCategories');
        },
        computed: {
            ...mapGetters([
                'categories',
            ])
        },
        components: {
            Category,
        },
        methods: {}
    }

</script>