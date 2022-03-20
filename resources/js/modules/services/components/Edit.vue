<template>
    <span>
        <button class="btn btn-primary btn-round" data-toggle="modal" :data-target="'#editModal' + service.id">
            <i class="fa fa-edit"></i>
        </button>
    <div class="modal fade font-weight-bold text-primary text-left" :id="'editModal' + service.id" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="mdal-title">Редактирование услуги:<br> <b>{{service.name}}</b></h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <i class="fa fa-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                        <form @submit.prevent="updateService()" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Название</label>
                                        <input type="text" class="form-control" v-model="service.name"
                                               required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Стоимость</label>
                                        <input type="text" class="form-control" v-model="service.price">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Описание</label>
                                        <textarea type="text" class="form-control" v-model="service.description"
                                                  required>
                                            Описание . . .
                                        </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Входящие услуги</label>
                                        <multiselect v-model="service.child_services"
                                                     :options="services"
                                                     :multiple="true"
                                                     :close-on-select="false"
                                                     placeholder="Pick some"
                                                     label="name"
                                                     track-by="name"
                                        ></multiselect>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="typo__label">Категория</label>
                                          <multiselect v-model="service.category" :options="categories"
                                                       group-values="sub_categories" group-label="name"
                                                       :close-on-select="false"
                                                       placeholder="Type to search" track-by="name" label="name">
                                              <span slot="noResult">Oops! No elements found. Consider changing the search query.</span>
                                          </multiselect>

                                    </div>
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">Изменить</button>
                                <button :id="'close' + service.id" type="button" class="btn btn-danger" data-dismiss="modal">Закрыть
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
    import Multiselect from 'vue-multiselect'

    export default {
        computed: {
            ...mapGetters([
                'categories',
                'services',
            ])
        },
        props: ['service'],
        components: {Multiselect},
        methods: {

            updateService() {
                document.getElementById('close' + this.service.id).click();
                this.service.category_id = this.service.category.id;
                this.$store.dispatch('updateService', this.service);
            },
        }
    }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>