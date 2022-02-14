<template>
    <span>
        <button class="btn btn-primary btn-round" data-toggle="modal" :data-target="'#editModal' + role.id">
            <i class="fa fa-edit"></i>
        </button>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + role.id" tabindex="-1"
         role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Редактирование роли:<br> {{role.name}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="editRole()" method="post">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="bmd-label-floating">Имя</label>
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
                                        <option v-for="permission in allPermissions" :value="permission"
                                                >
                                            {{permission.name}}
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Изменить</button>
                            <button :id="'close' + role.id" type="button" class="btn btn-danger" data-dismiss="modal">Закрыть
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
    export default {
        data() {
            return {
                role: this.initialRole,
                permissions: null,
            }
        },
        props: ['initialRole', 'allPermissions'],
        methods: {
            editRole() {
                document.getElementById('close' + this.role.id).click();
                this.$emit('update', this.role);
            },
            hasPermission(id) {
                console.log(this.role.permissions.find(perm => perm.id === id));
                return !!this.role.permissions.find(perm => perm.id === id);
            }
        }
    }
</script>
