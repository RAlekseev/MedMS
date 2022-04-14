<template>
    <span>
            <i class="fa fa-edit text-primary" data-toggle="modal" :data-target="'#editModal' + config.id"></i>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + config.id" tabindex="-1"
         role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="mdal-title">Редактирование параметра системы:<br> <b>{{config.name}}</b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                        <form @submit.prevent="updateConfig()" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Значение</label>
                                        <input type="text" class="form-control" v-model="config.value"
                                               required>
                                    </div>
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Изменить</button>
                                <button :id="'close' + config.id" type="button" class="btn btn-danger"
                                        data-dismiss="modal">Закрыть
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
        props: ['config'],
        methods: {
            updateConfig() {
                document.getElementById('close' + this.config.id).click();
                this.$store.dispatch('updateConfig', this.config);
            },
        }
    }
</script>

<style scoped>
    i {
        cursor: pointer;
    }
</style>