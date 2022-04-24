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
                        <h4 class="modal-title">Создание шаблона документа</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="createDocTemplate()" method="post">
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
        data() {
            return {
                doc_template: {
                    table: null
                },
            }
        },
        computed: {
            ...mapGetters([
                'doc_templates_tables',
            ])
        },
        methods: {
            createDocTemplate() {
                document.getElementById('close').click();
                this.$store.dispatch('createDocTemplate', this.doc_template)
            },
        }
    }
</script>
