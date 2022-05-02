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
                    <i class="text-primary fa fa-heartbeat"></i> {{category.name}}
                    <Edit :category="category"></Edit>
                    <Delete :category="category"></Delete>
                    <ul>
                        <li v-for="sub_category in category.sub_categories" :key="sub_category.id">
                            <i class="text-primary fa fa-heartbeat"></i> {{sub_category.name}}
                            <Edit :category="category"></Edit>
                            <Delete :category="category"></Delete>
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

    export default {
        metaInfo: {
            title: 'Категории'
        },
        computed: {
            ...mapGetters([
                'categories',
                'can',
            ])
        },
        components: {
            Create,
            Edit,
            Delete,
        },
        mounted() {
            this.$store.dispatch('getCategories').then(() => {
                window.$('#data_table').DataTable(dataTableConfig);
            });
        },
        methods: {
            is_available_actions() {
                return this.can('categories-update') || this.can('categories-delete');
            },
        }
    }
</script>
