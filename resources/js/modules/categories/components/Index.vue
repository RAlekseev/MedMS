<template>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Категории
                <Create v-if="can('categories-create')"></Create>
            </h6>
        </div>

        <div class="card-body">
            <ul>
                <li v-for="category in categories" :key="category.id">
                    <Icon :icon_id="category.icon_id"></Icon>
                    {{category.name}}
                    <Edit :category="category" v-if="can('categories-update')"></Edit>
                    <Delete :category="category" v-if="can('categories-delete')"></Delete>
                    <ul>
                        <li v-for="sub_category in category.sub_categories" :key="sub_category.id">
                            <Icon :icon_id="sub_category.icon_id"></Icon>
                            {{sub_category.name}}
                            <Edit :category="sub_category" v-if="can('categories-update')" ></Edit>
                            <Delete :category="sub_category" v-if="can('categories-delete')"></Delete>
                            <ul>
                                <li v-for="sub_sub_category in sub_category.sub_categories" :key="sub_sub_category.id">
                                    <Icon :icon_id="sub_sub_category.icon_id"></Icon>
                                    {{sub_sub_category.name}}
                                    <Edit :category="sub_sub_category" v-if="can('categories-update')"></Edit>
                                    <Delete :category="sub_sub_category" v-if="can('categories-delete')"></Delete>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</template>


<script>
    import {mapGetters} from 'vuex'

    import Create from "./Create";
    import Edit from "./Edit";
    import Delete from "./Delete";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";
    import Icon from "./Icon";

    export default {
        metaInfo: {
            title: 'Категории'
        },
        computed: {
            ...mapGetters([
                'categories',
                'can',
                'icon_types'
            ])
        },
        components: {
            Create,
            Edit,
            Delete,
            Icon,
        },
        mounted() {
            this.$store.dispatch('getCategories').then(() => {
                window.$('#data_table').DataTable(dataTableConfig);
            });
            this.$store.dispatch('getIconTypes')
        },
        methods: {
            is_available_actions() {
                return this.can('categories-update') || this.can('categories-delete');
            },
        }
    }
</script>

<style scoped>
    ::v-deep img {
        width: 24px;
        height: 24px;
    }
</style>
