<template>
    <span>
        <button class="btn btn-primary btn-round" data-toggle="modal" :data-target="'#editModal' + doc_template.id">
            <i class="fa fa-edit"></i>
        </button>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + doc_template.id" tabindex="-1"
         role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Редактирование шаблона документа:<br> {{doc_template.name}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <form @submit.prevent="updateDocTemplate()" method="post">
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Название шаблона</label>
                                        <input type="text" class="form-control" v-model="doc_template.name"
                                               required>
                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Документ для</label>

                                        <select class="custom-select" aria-label="Документ для" v-model="doc_template.table">
                                            <option v-for="table in doc_templates_tables" :key="table.value" :value="table.value">
                                                {{table.name}}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Изменить</button>
                            <button :id="'close' + doc_template.id" type="button" class="btn btn-danger"
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
    import {mapGetters} from "vuex";

    export default {
        props: ['doc_template'],
        computed: {
            ...mapGetters([
                'doc_templates_tables',
            ])
        },
        methods: {
            updateDocTemplate() {
                document.getElementById('close' + this.doc_template.id).click();
                this.$store.dispatch('updateDocTemplate', this.doc_template)
            },
        }
    }
</script>
