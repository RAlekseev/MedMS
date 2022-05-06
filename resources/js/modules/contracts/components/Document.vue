<template>
    <li class="list-group-item d-flex justify-content-between align-items-center  border-0 px-0 pb-0">
        <div style="max-width: 70%">
            {{doc_template.name}}
        </div>
        <button class="btn btn-warning">
            <i class="fa fa-print"></i>
        </button>
        <button class="btn btn-success btn-round" data-toggle="modal" :data-target="'#uploadModal' + doc_template.id">
            <i class="fa fa-upload"></i>
        </button>
        <div class="modal fade font-weight-bold text-primary text-left" :id="'uploadModal' + doc_template.id"
             tabindex="-1"
             role="dialog" aria-labelledby="editModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Загрузка документа:<br> {{doc_template.name}}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="storeDocument()" method="post">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="file-upload-wrapper">
                                        <input @change="onChange" type="file" :id="'file-upload' + doc_template.id"
                                               class="file-upload"/>
                                    </div>
                                </div>
                            </div>

                            <vue-pdf-embed v-if="document.base64" :source="document.base64" width="466"/>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Загрузить</button>
                                <button :id="'close' + doc_template.id" type="button" class="btn btn-danger"
                                        data-dismiss="modal">Закрыть
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </li>
</template>

<script>
    import VuePdfEmbed from 'vue-pdf-embed/dist/vue2-pdf-embed'
    import PictureInput from 'vue-picture-input';
    import {getBase64} from '../../../core/utils/FileUtil'

    export default {
        data() {
            return {
                document: {
                    name: null,
                    file: null,
                    base64: null,
                },
            }
        },
        props: ['doc_template'],
        methods: {
            storeDocument() {

            },
            onChange(event) {
                console.log(event.target.files);
                let file = event.target.files[0];
                this.image.file = file;
                getBase64(file).then(data => {this.image.file = data})
            },
            storeIcon() {
                let formData = new FormData();
                formData.append('name', this.image.name);

                if (this.image.file) {
                    formData.append('icon', this.image.file);
                }

                this.$store.dispatch('storeIcon', formData)
            },
        },
        components: {
            PictureInput,
            VuePdfEmbed,
        }
    }
</script>