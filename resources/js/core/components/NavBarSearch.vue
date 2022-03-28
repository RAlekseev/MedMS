<template>
    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
          :style="searchStyle">
        <div class="ext_screen" v-if="is_visible" @click="is_visible = false"></div>

        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Поиск..."
                   aria-label="Search" aria-describedby="basic-addon2" v-model="query"
                   @input="getResult()" @keypress.enter.prevent="getResult()" @focus="is_visible = true">
            <div class="bg-light" style="padding: 10px; z-index:9999" @click="deleteQuery()" v-if="query">
                <i class="fa fa-times"></i>
            </div>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
            <div class="bg-light search-results" v-if="is_visible">
                <div v-if="searchResults.length">

                    <div v-if="searchResults.length < 6">
                        <div class="px-4" v-for="searchResult in searchResults" :key="searchResult.id">
                            <Service :service="searchResult"></Service>
                        </div>
                    </div>
                    <div v-else>
                        <div class="px-4" v-for="searchResult in searchResults.slice(0, 5)" :key="searchResult.id">
                            <Service :service="searchResult"></Service>
                        </div>
                        <div class="px-4 pb-4">
                            <div class="row p-1">
                                <div class="col-12">
                                    Показано 5 из <b>{{searchResults.length}}</b> результатов
                                    <a href="#" @click.prevent="more()">
                                        Подробнее
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div v-else>
                    <div class="row p-2">
                        <div class="col-lg-12">
                            <h5>Результатов не обнаружено...</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</template>

<script>
    import {mapGetters} from "vuex";
    import Service from "../../modules/common/components/Service"

    export default {
        data() {
            return {
                query: null,
                is_visible: false,
            }
        },
        computed: {
            ...mapGetters([
                'searchResults'
            ])
        },
        props: ['searchStyle'],
        components: {
            Service
        },
        methods: {
            getResult() {
                this.$store.dispatch('makeSearch', {query: this.query});
            },
            deleteQuery() {
                this.query = null;
                this.is_visible = false;
            },
            more() {
                this.is_visible = false;
                console.log(this.query)
                this.$router.push({path: '/services', query: this.query});
            }
        }
    }
</script>

<style scoped>
    .search-results {
        border-radius: 0.35rem;
        /*height: 100px;*/
        width: 100%;
        background-color: #fff;
        position: absolute;
        margin-top: 40px;
        z-index: 9999;
    }

    form {
        z-index: 10;
        /*margin-left: 16px;*/
    }

    .ext_screen {
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        z-index: 2;
        background-color: #000;
        opacity: 0.5;
    }

    input {
        z-index: 8;
    }
</style>