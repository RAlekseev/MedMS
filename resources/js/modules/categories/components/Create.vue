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
                        <h4 class="modal-title">Создание категории</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="createCategory()" method="post">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Название <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" v-model="category.name"
                                               required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                            <label class="typo__label">Иконка <span class="text-danger">*</span></label>
                                            <multiselect v-model="category.icon" :options="icon_types"
                                                         :close-on-select="true" group-values="icons"
                                                         group-label="name"
                                                         placeholder="Выберите изображение" track-by="id"
                                                         label="name">
                                                <span slot="noResult">Ни одной иконки не обнаружено</span>


                                                <template slot="singleLabel" slot-scope="props">
                                                    <span v-html="html(props)"></span>
<!--                                                    <i :class="'fa ' + props.option.name"></i>-->
                                                     <span class="option__title">{{ props.option.source }}</span>
                                                </template>
                                                 <template slot="option" slot-scope="props">
                                                     <span v-html="html(props)"></span>
<!--                                                     <i :class="'fa ' + props.option.name"></i>-->
                                                     <span class="option__title">{{ props.option.source ? props.option.source : props.option.$groupLabel}}</span>
                                                 </template>
                                            </multiselect>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="typo__label">Родительская категория</label>
                                          <multiselect v-model="category.category_id" :options="categories"
                                                       group-values="sub_categories" group-label="name"
                                                       :close-on-select="false"
                                                       placeholder="Выберите рдительскую категорию" track-by="name" label="name">
                                              <span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
                                          </multiselect>

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
    import Multiselect from "vue-multiselect";

    export default {
        data() {
            return {
                category: {
                    name: null,
                    icon: null,
                    category_id: null,
                },
            }
        },
        computed: {
            ...mapGetters([
                'categories',
                'icon_types',
            ])
        },
        methods: {
            createCategory() {
                document.getElementById('close').click();
                this.category.icon_id = this.category.icon.id;
                this.$store.dispatch('createCategory', this.category)
            },
            html(props) {
                let icon = props.option;
                if (icon.icon_type_id) {
                    let icon_type = this.icon_types.find(item => item.id == icon.icon_type_id);
                    return icon_type.template.replace('$source', icon.source);
                }
                return '';
            },
        },
        components: {
            Multiselect,
        }
    }
</script>
