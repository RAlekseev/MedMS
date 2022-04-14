<template>
    <div>
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">Настройки</li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">

            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            Параметры системы
                        </h6>
                    </div>
                    <div class="card-body">
                        <div v-for="config in configs" :key="config.id" v-if="configs.length">
                            <div class="row">
                                <div class="col-sm-4 pl-4">
                                    <h6 class="mb-0">
                                        {{config.name}}
                                    </h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    {{config.value}}
                                    <Edit :config="config" v-if="can('settings-update')"></Edit>
                                </div>

                            </div>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Edit from "./Edit";

    export default {
        metaInfo: {
            title: 'Настройки'
        },
        computed: {
            ...mapGetters([
                'configs',
                'can',
            ])
        },
        components: {
            Edit
        }
    }
</script>