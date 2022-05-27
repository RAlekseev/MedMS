<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <router-link to="/">Главная</router-link>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Отделения</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Отделения
                            <Create v-if="can('users-create')"></Create>
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="data_table" class="display table-bordered" style="width:100%;">
                                <thead>
                                <tr>
                                    <th>№</th>
                                    <th>Название</th>
                                    <th>Иконка</th>
                                    <th>Описание</th>
                                    <th>Сотрудники</th>
                                    <th>Услуги</th>
                                    <th class="text-right" v-if="this.can('departments-update', 'departments-delete')">
                                        Действия
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(department, i) in departments">
                                        <td>
                                            {{i+1}}
                                        </td>
                                        <td>
                                            <router-link :to="'/departments/show/' + department.id"
                                                         v-if="can('departments-show')">
                                                <b>{{department.name}}</b>
                                            </router-link>
                                            <b v-else>
                                                {{department.name}}
                                            </b>
                                        </td>
                                        <td>
                                            <Icon :icon_id="department.icon.id"></Icon>
                                        </td>

                                        <td>{{department.description}}</td>
                                        <td>{{department.employees.length}}</td>
                                        <td>{{department.employees.length}}</td>

                                        <td class="text-right" v-if="can('departments-update', 'departments-delete')">
                                            <div>
                                                <Edit :department="department" v-if="can('departments-update')"></Edit>
                                                <Delete :department="department" v-if="can('departments-delete')"></Delete>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Create from "./Create";
    import Edit from "./Edit";
    import Delete from "./Delete";
    import dataTableConfig from "../../../core/utils/DataTablesConfig";
    import Icon from "../../icons/components/Icon";

    export default {
        metaInfo: {
            title: 'Отделения'
        },
        components: {
            Create,
            Edit,
            Delete,
            Icon,
        },
        mounted() {
            this.$store.dispatch('getIconTypes');
            this.$store.dispatch('getDepartments')
                .then(() => {window.$('#data_table').DataTable(dataTableConfig);});
        },
        computed: {
            ...mapGetters([
                'departments',
                'can',
            ])
        },
    }
</script>

<style scoped>
    ::v-deep img {
        width: 24px;
        height: 24px;
    }
</style>