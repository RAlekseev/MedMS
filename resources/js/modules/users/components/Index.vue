<template>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">

                <table id="data_table" class="display table-bordered" style="width:100%;">
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Имя</th>
                        <th>Почта</th>
                        <th class="text-right">Действия</th>
                    </tr>
                    </thead>
                    <tbody v-if="users">

                    <tr v-for="user in users">
                        <td class="text-center">{{user.id}}</td>
                        <td>
                            <a href="#">
                                {{user.name}}
                            </a>
                        </td>
                        <td>{{user.email}}</td>


                        <td class="td-actions text-right">
<!--                            <form id="delete[{{$user->id}}]"-->
<!--                                  action="{{ route('lms.admin.users.destroy', $user->id) }}"-->
<!--                                  method="POST" style="display: none;"> @csrf @method('DELETE')</form>-->
<!--                            <a href="{{route('lms.admin.users.change_pass', $user->id)}}"-->
<!--                               title="Сбросить пароль" data-turbolinks="false">-->
<!--                                <button type="button" rel="tooltip" class="btn btn-success btn-round">-->
<!--                                    <i class="material-icons">ac_unit</i>-->
<!--                                </button>-->
<!--                            </a>-->
                            <button type="submit"
                                    class="btn btn-danger btn-round">
                                <i class="material-icons">close</i>
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';
    export default {
        data() {
            return {
                loading: false,
                users: null,
                error: null,
            };
        },
        created() {
            this.fetchData();
        },
        methods: {
            fetchData() {
                this.error = this.users = null;
                this.loading = true;
                axios
                    .get('/api/users')
                    .then(response => {
                        this.loading = false;
                        this.users = response.data;
                    }).catch(error => {
                    this.loading = false;
                    this.error = error.response.data.message || error.message;
                });
            }
        }
    }
</script>

<!--<link rel="stylesheet" type="text/css"-->
<!--      href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.11.3/af-2.3.7/b-2.0.1/b-colvis-2.0.1/b-html5-2.0.1/b-print-2.0.1/cr-1.5.5/kt-2.6.4/sb-1.3.0/sp-1.4.0/sl-1.3.3/datatables.min.css"/>-->

<!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>-->
<!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>-->
<!--<script type="text/javascript"-->
<!--        src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.11.3/af-2.3.7/b-2.0.1/b-colvis-2.0.1/b-html5-2.0.1/b-print-2.0.1/cr-1.5.5/kt-2.6.4/sb-1.3.0/sp-1.4.0/sl-1.3.3/datatables.min.js"></script>-->


<!--<script>-->
<!--    document.addEventListener('turbolinks:load', function() {-->
<!--        // console.log(document.querySelectorAll('#users_table'));-->
<!--        $(document).ready(function() {-->
<!--            setTimeout(function() {-->
<!--                $('#data_table').DataTable({-->
<!--                        select: {-->
<!--                            info: false,-->
<!--                            items: 'cell',-->
<!--                        },-->
<!--                        autoFill: true,//-->
<!--                        colReorder: true,-->
<!--                        keys: true,//-->
<!--                        buttons: [-->
<!--                            'excel', 'pdf',-->
<!--                            // {-->
<!--                            //     extend: 'searchPanes',-->
<!--                            //     config: {-->
<!--                            //         cascadePanes: true-->
<!--                            //     }-->
<!--                            // },-->
<!--                            // {-->
<!--                            //     extend: 'searchBuilder',-->
<!--                            //     config: {-->
<!--                            //         depthLimit: 2-->
<!--                            //     }-->
<!--                            // },-->
<!--                        ],-->
<!--                        searchPanes: {-->
<!--                            collapse: true,-->
<!--                            columns: [4]-->

<!--                        },-->
<!--                        dom: "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'<'pull-right'B>>>" +-->
<!--                            "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +-->
<!--                            "<'row'<'col-sm-12'tr>>" +-->
<!--                            "<'row'<'col-sm-12'<'pull-center'p>>>" +-->
<!--                            // "<'row'<'col-sm-12'P>>" +-->
<!--                            "<'row'<'col-sm-12 col-md-6'P><'col-sm-12 col-md-6'Q>>",-->

<!--                    stateSave: true-->
<!--            });-->
<!--                $('#data_table').show();-->
<!--            }, 500);-->
<!--        });-->
<!--    });-->
<!--</script>-->
<!--<style>-->
<!--    #data_table tbody tr.selected {-->
<!--        background-color: #ec407a;-->
<!--    }-->

<!--    .dtsp-titleRow {-->
<!--        display: none !important;-->
<!--    }-->
<!--</style>-->
