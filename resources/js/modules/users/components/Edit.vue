<template>
    <span>
        <button class="btn btn-primary btn-round" data-toggle="modal" :data-target="'#editModal' + user.id">
            <i class="fa fa-edit"></i>
        </button>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + user.id" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Редактирование пользователя:<br> {{user.name}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="editUser()" method="post">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="bmd-label-floating">Имя</label>
                                    <input type="text" class="form-control" name="name" v-model="user.name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label class="bmd-label-floating">Почта</label>
                                    <input type="email" class="form-control" name="email" v-model="user.email" required>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Изменить</button>
                            <button :id="'close' + user.id" type="button" class="btn btn-danger" data-dismiss="modal">Закрыть
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
                user: this.initialUser
            }
        },
        props: ['initialUser'],
        methods: {
            editUser() {
                document.getElementById('close' + this.user.id).click();
                this.$emit('update', this.user);
            }
        }
    }
</script>
