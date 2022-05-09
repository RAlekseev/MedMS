<template>
    <span>
        <button class="ml-3 btn btn-success btn-round" data-toggle="modal" data-target="#createModal">
            <i class="fa fa-plus"></i> Приход
        </button>

        <div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="createModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Создание Прихода</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="createIncome()" method="post">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Контрагент<span
                                                class="text-danger">*</span></label>
                                        <input type="text" class="form-control" v-model="movement.contractor" required>
                                    </div>
                                </div>
                                 <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Дата<span class="text-danger">*</span></label>
                                        <input type="date" class="form-control" v-model="movement.date" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row" v-for="(inventory, i) in movement.inventories">
                                <div class="col-md-4" v-if="inventory.is_new">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Название</label>
                                        <input type="text" class="form-control" v-model="movement.inventories[i].new_name" required
                                        @focus="clrInventoryName(i)">
                                    </div>
                                </div>
                                <div class="col-md-4" v-if="inventory.is_new">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Ед.</label>
                                        <input type="text" class="form-control" v-model="movement.inventories[i].unit" required>
                                    </div>
                                </div>

                                <div class="col-md-8" v-else>
                                    <div class="form-group">
                                        <label class="typo__label">Выберите объект прихода</label>
                                        <Multiselect v-model="movement.inventories[i]"
                                                     :options="income_inventories"
                                                     :close-on-select="true"
                                                     placeholder="Выберите объект прихода"
                                                     :aria-multiline="true"
                                                     track-by="name"
                                                     @input="movement.inventories[i] = Object.assign({}, $event, {new_name: ''})">

                                            <span slot="noResult">Ни одного объекта не обнаружено</span>
                                            <template slot="singleLabel" slot-scope="props">
                                                <span class="option__title">
                                                    {{ props.option.name + (props.option.unit ? '  Ед. ' + props.option.unit : "")}}
                                                </span>
                                            </template>
                                            <template slot="option" slot-scope="props">
                                                <span class="option__title">
                                                    {{ props.option.name + (props.option.unit ? '  Ед. ' + props.option.unit : "")}}
                                                </span>
                                            </template>

                                        </Multiselect>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Количество</label>
                                        <input type="number" class="form-control" v-model="movement.inventories[i].amount" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-4">
                                <div class="m-auto">
                                     <i class="fa fa-minus text-danger" v-if="movement.inventories.length > 1"
                                        @click="delInventory()"></i>
                                <i class="fa fa-plus text-success" @click="addInventory()"></i>
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
    import {Multiselect} from "vue-multiselect";
    import {mapGetters} from "vuex";

    export default {
        data() {
            return {
                movement: {
                    contractor: null,
                    date: null,
                    factor: 1,
                    inventories: [
                        {
                            id: 1,
                            name: "Не выбрано",
                            unit: null,
                            amount: null,
                        }
                    ],
                },
            }
        },
        components: {
            Multiselect,
        },
        computed: {
            ...mapGetters([
                'inventories',
            ]),
            income_inventories: function () {
                const inventories = this.inventories;
                let result = [...inventories];
                result.unshift({
                    name: 'Создать новый объект',
                    is_new: true,
                    unit: '',
                });
                return [...result]
            },
        },
        methods: {
            createIncome() {
                document.getElementById('close').click();
                this.$store.dispatch('createMovement', this.movement)
            },
            addInventory() {
                this.movement.inventories.push({
                    name: "Не выбранно",
                    new_name: null,
                })
            },
            delInventory() {
                this.movement.inventories.pop()
            },
            clrInventoryName(i) {
                console.log(i);
                this.movement.inventories[i].new_name = '';
                console.log(this.movement.inventories[i]);
            }
        }
    }
</script>
