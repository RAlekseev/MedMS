<template>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
                <div class="col-md-2">
                    <h6 class="m-0 pt-2 font-weight-bold text-primary">
                        Расписание
                    </h6>
                </div>

                <div class="col-md-10 m-0">
                    <div class="form-group">
                        <multiselect v-model="user" :options="employees"
                                     :close-on-select="true" :show-labels="false"
                                     placeholder="Выберите сотрудника" track-by="id" label="full_name">
                            <span slot="noResult">Не найдено ни одного сотрудника.</span>
                        </multiselect>

                    </div>
                </div>
            </div>
        </div>

        <div class="card-body">
            <Schedule :user="user" @updateUser="updateUser"></Schedule>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from 'vuex'
    import Multiselect from "vue-multiselect";
    import Schedule from "./Schedule";

    export default {
        data() {
            return {
                user: null,
            }
        },
        computed: {
            ...mapGetters([
                'can',
                'employees',
            ])
        },
        components: {
            Schedule,
            Multiselect,
        },
        mounted() {
            this.$store.dispatch('getEmployees')
        },
        methods: {
            updateUser() {
                this.$store.dispatch('getEmployees')
                    .then(() => {this.user = this.employees.find(user => user.id === this.user.id)})
            }
        },
    }
</script>
