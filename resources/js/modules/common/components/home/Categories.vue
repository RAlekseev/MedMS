<template>
    <div class="my-3">
        <div class="row m-3" v-for="category in categories" :key="category.id">
            <div class="row my-3 mx-auto">
                <div class="col-2 p-0 text-right">
                    <i class="fa fa-heartbeat fa-2x"></i>
                </div>
                <div class="col-10 m-auto">
                    <h2 class="">{{category.name}}</h2>
                </div>
            </div>

            <Category :category="category"/>

<!--            <div class="row m-3">-->
<!--                <Category v-for="sub_category in subCategories(category)"-->
<!--                          :category="sub_category"-->
<!--                          :key="sub_category.id"/>-->
<!--                <a href="#" class="col-xs-12 col-sm-6 col-lg-4 my-3" @click.prevent="toggleCategory(category.id)">-->
<!--                    <div class="card p-3  h-100">-->
<!--                        <div class="row h-100">-->
<!--                            <div class="col-2 m-auto">-->
<!--                                <i class="fa fa-plus fa-3x text-primary"></i>-->
<!--                            </div>-->
<!--                            <div class="col-10 m-auto">-->
<!--                                <h4>-->
<!--                                    Показать еще <b>{{category.sub_categories.length - 5}}</b>-->
<!--                                </h4>-->
<!--                            </div>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </a>-->
<!--            </div>-->
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Category from "./Category";

    export default {
        data() {
            return {

            }
        },
        mounted() {
            this.$store.dispatch('getGuestServicesCategories');
        },
        computed: {
            ...mapGetters([
                'categories',
            ]),
        },
        components: {
            Category,
        },
        methods: {
            toggleCategory(id) {
                this.$store.dispatch('toggleCategory', id);
            },
            // subCategories(category) {
            //     console.log(this.categories.find(item => item.id === category.id));
            //     if (!category.sub_categories) { return []}
            //     if (category.opened) {
            //         return category.sub_categories
            //     } else {
            //         return category.sub_categories.slice(0, 5)
            //     }
            // },
        },
        watch: {
            subCategories: function (category) {
                if (!category.sub_categories) { return []}
                if (category.opened) {
                    return category.sub_categories
                } else {
                    return category.sub_categories.slice(0, 5)
                }
            },
        }
    }

</script>