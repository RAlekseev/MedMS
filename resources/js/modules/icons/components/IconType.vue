<template>
    <div>
        <div class="row" v-if="icon_type.icon_list">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="typo__label">Добавленные иконки</label>
                    <div class="row">
                        <div class="col-md-12" v-for="icon in icon_type.icons">
                            <span v-html="icon_type.template.replace('$source', icon.source)"></span>
                            {{icon.source}}
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
<!--                            <label class="typo__label">Иконки</label>-->
                            <multiselect v-model="image.name" :options="icon_type.icon_list"
                                         :close-on-select="true"
                                         placeholder="Выберите изображение" :aria-multiline="true">
                                <span slot="noResult">Ни одной иконки не обнаружено</span>
                                <template slot="singleLabel" slot-scope="props">
                                    <span v-html="icon_type.template.replace('$source', props.option)"></span>
                                    <span class="option__title">{{ props.option }}</span>
                                </template>
                                <template slot="option" slot-scope="props">
                                    <span v-html="icon_type.template.replace('$source', props.option)"></span>
                                    <span class="option__title">
                                {{ props.option }}
                            </span>
                                </template>
                            </multiselect>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group my-auto">
                            <button class="btn btn-success" @click.prevent="storeIcon" :disabled="!image.name">Добавить</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row" v-else>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="typo__label">Добавленные иконки</label>
                    <div class="row">
                        <div class="col-md-12" v-for="icon in icon_type.icons">
                                <span v-html="icon_type.template.replace('$source', icon.source)"></span>
                                {{icon.source}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="typo__label">Загрузить кастомную иконку</label>
                    <picture-input
                            ref="pictureInput"
                            width="600"
                            height="600"
                            accept="image/jpeg,image/png,image/svg+xml"
                            size="10"
                            :toggleAspectRatio="true"
                            :removable="true"
                            button-class="btn btn-primary"
                            :custom-strings="{
                                drag: 'Перетащите файл или кликните здесь',
                                upload: '<p>Your device does not support file uploading.</p>',
                                tap: 'Tap here to select a photo <br>from your gallery',
                                change: 'Изменить',
                                remove: 'Удалить',
                                select: 'Выберите файл',
                                selected: '<p>Изображеение успешно выбрано!</p>',
                                fileSize: 'Размер файла привышает лимит',
                                fileType: 'Данный тип файла не поддерживаеется'
                            }"
                            @change="onChange">
                    </picture-input>

                    <div class="row" v-if="image.file">
                        <div class="col">
                            <div class="form-group">
                                <input type="text" class="form-control" v-model="image.name" title="Название иконки"
                                       required>
                            </div>
                        </div>
                        <div class="col">
                        <button class="btn btn-success" @click.prevent="storeIcon">Сохранить</button>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <hr>
    </div>
</template>

<script>
    import {Multiselect} from "vue-multiselect";
    import PictureInput from 'vue-picture-input';

    export default {
        data() {
            return {
                image: {
                    name: null,
                    icon_type_id: this.icon_type.id,
                    file: null,
                },
            }
        },
        props: ['icon_type'],
        components: {
            Multiselect,
            PictureInput,
        },
        methods: {
            onChange(image) {
                if (image) {
                    this.image.name = this.$refs.pictureInput.file.name.replace(/\.[^/.]+$/, "");
                    this.image.file = this.$refs.pictureInput.file;
                } else {
                    console.log('FileReader API not supported: use the <form>!')
                }
            },
            storeIcon() {
                let formData = new FormData();
                formData.append('name', this.image.name);
                formData.append('icon_type_id', this.image.icon_type_id);

                if (this.image.file) {
                    formData.append('icon', this.image.file);
                }

                this.$store.dispatch('storeIcon', formData)
            }
        }
    }
</script>

<style scoped>
   ::v-deep img {
        width: 24px;
        height: 24px;
    }
</style>