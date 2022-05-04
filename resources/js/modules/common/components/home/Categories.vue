<template>
    <div class="my-3">
        <div class="row m-3" v-for="category in categories" :key="category.id">
            <div class="row my-3 mx-auto">
                <div class="col-3 p-0 text-right">
                    <Icon :icon_id="category.icon_id"></Icon>
                </div>
                <div class="col-7 m-auto">
                    <h2 class="">{{category.name}}</h2>
                </div>
            </div>

            <Category :category="category"/>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Category from "./Category";
    import Icon from "../../../categories/components/Icon";

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
            Icon,
        },
        methods: {
            toggleCategory(id) {
                this.$store.dispatch('toggleCategory', id);
            },
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

<style scoped>
    ::v-deep .icon {
        width: 50px;
        height: 50px;
        font-size: 50px;
    }
</style>