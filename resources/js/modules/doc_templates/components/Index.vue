<template>

    <div>
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Шаблоны документов</li>
            </ol>
        </nav>

    <div class="card shadow mb-4">

        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Шаблоны документов
                <Create v-if="can('doc-templates-create')"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Название</th>
                        <th>Для</th>
                        <th>Создано</th>
                        <th>Обновлено</th>
                        <th class="text-right" v-if="is_available_actions()">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="doc_templates">
                    <tr v-for="doc_template in doc_templates" :key="doc_template.id">
                        <td class="text-center">{{doc_template.id}}</td>
                        <td>
                            <router-link :to="{path: `/doc_templates/show/${doc_template.id}`}" v-if="can('doc-templates-show')">
                                {{doc_template.name}}
                            </router-link>
                            <span v-else>
                                {{doc_template.name}}
                            </span>
                        </td>
                        <td>{{doc_template.table}}</td>
                        <td>{{doc_template.created_at}}</td>
                        <td>{{doc_template.updated_at}}</td>

                        <td class="text-right" v-if="is_available_actions()">
                            <div>
                                <Edit :doc_template="doc_template" v-if="can('doc-templates-update')"></Edit>
                                <Delete :doc_template="doc_template" v-if="can('doc-templates-delete')"></Delete>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
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
            title: 'Шаблоны документов'
        },
        computed: {
            ...mapGetters([
                'doc_templates',
                'can',
            ])
        },
        components: {
            Create,
            Edit,
            Delete
        },
        mounted() {
            this.$store.dispatch('getDocTemplates').then(() => {
                window.$('#data_table').DataTable(dataTableConfig);
            });
        },
        methods: {
            is_available_actions() {
                return this.can('doc-templates-update') || this.can('doc-templates-delete') || this.can('doc-templates-show');
            }
        }
    }
</script>
