<template>
    <span>
        <button class="btn btn-success btn-round" data-toggle="modal" data-target="#createModal">
            <i class="fa fa-plus"></i> Создать
        </button>

        <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Создание Роли</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="createRole()" method="post">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Название</label>
                                        <input type="text" class="form-control" v-model="role.name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Код</label>
                                        <input type="text" class="form-control" v-model="role.slug" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                            <label class="bmd-label-static">Права роли</label>
                                            <select class="custom-select" data-style="select-with-transition"
                                                    title="Выбрать права роли" v-model="role.permissions" multiple>
                                                <option v-for="permission in permissions" :value="permission.id"
                                                        :key="permission.id">
                                                    {{permission.name}}
                                                </option>
                                            </select>
                                    </div>
                                </div>
                            </div>



                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Создать</button>
                                <button id="close" type="button" class="btn btn-danger" data-dismiss="modal">Закрыть
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </span>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        computed: {
            ...mapGetters([
                'permissions',
            ])
        },
        data() {
            return {
                role: {},
            }
        },
        methods: {
            createRole() {
                document.getElementById('close').click();
                this.$store.dispatch('createRole', this.role)
            },
        }
    }
</script>
