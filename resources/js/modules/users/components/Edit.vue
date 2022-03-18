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
                    <h4 class="modal-title">Редактирование пользователя:<br> {{user.full_name}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="updateUser()" method="post">
                        <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Имя</label>
                                        <input type="text" class="form-control" v-model="user.first_name"
                                               required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Фамилия</label>
                                        <input type="text" class="form-control" v-model="user.last_name"
                                               required>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Отчество</label>
                                        <input type="text" class="form-control" v-model="user.middle_name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Почта</label>
                                        <input placeholder="example@mail.ru" type="email" class="form-control" v-model="user.email"
                                               required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Номер телефона</label>
                                        <input placeholder="+996(XXX)XXX-XXXX" type="tel" class="phone form-control"
                                               required v-model="user.phone" v-mask="'+996(###)###-####'">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label class="bmd-label-static">Группа(ы)</label>
                                            <select class="custom-select" data-style="select-with-transition"
                                                    title="Выбрать группы пользователя" v-model="user.roles" multiple>
                                                <option v-for="role in roles" :value="role"
                                                        :key="role.id">
                                                    {{role.name}}
                                                </option>
                                            </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Дата рождения</label>
                                        <input type="date" class="form-control"
                                               required v-model="user.birthday">
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
    import {mapGetters} from "vuex";

    export default {
        props: ['user'],
        computed: {
            ...mapGetters([
                'roles',
            ])
        },
        methods: {
            updateUser() {
                    document.getElementById('close' + this.user.id).click();
                    this.$store.dispatch('updateUser', this.user)
            },
        }
    }
</script>
