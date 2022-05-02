<template>
    <span>
        <i data-toggle="modal" :data-target="'#editModal' + category.id" class="text-success fa fa-edit"></i>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + category.id" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="mdal-title">Редактирование услуги:<br> <b>{{category.name}}</b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                        <form @submit.prevent="updateCategory()" method="post">
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
                                            <multiselect v-model="category.icon" :options="icons"
                                                         :close-on-select="true"
                                                         placeholder="Выберите изображение" track-by="name"
                                                         label="name">
                                                <span slot="noResult">Ни одной иконки не обнаружено</span>
                                                <template slot="singleLabel" slot-scope="props">
                                                    <i :class="'fa ' + props.option.name"></i>
                                                     <span class="option__title">{{ props.option.name }}</span>
                                                </template>
                                                 <template slot="option" slot-scope="props">
                                                     <i :class="'fa ' + props.option.name"></i>
                                                     <span class="option__title">{{ props.option.name }}</span>
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
                                <button type="submit" class="btn btn-primary">Изменить</button>
                                <button :id="'close' + category.id" type="button" class="btn btn-danger" data-dismiss="modal">Закрыть
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
    import faIconsList from "../../../core/utils/FontAwesomIconsCodes";
    import Multiselect from 'vue-multiselect';

    export default {
        data() {
            return {
                icons: faIconsList
            }
        },
        computed: {
            ...mapGetters([
                'categories',
            ])
        },
        props: ['category'],
        components: {Multiselect},
        methods: {

            updateCategory() {
                document.getElementById('close' + this.category.id).click();
                this.$store.dispatch('updateCategory', this.category);
            },
        }
    }
</script>