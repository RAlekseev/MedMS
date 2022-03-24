<template>
    <form class="d-none d-sm-inline-block form-inline my-2 navbar-search w-100">
        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Поиск..."
                   aria-label="Search" aria-describedby="basic-addon2" v-model="query"
                   @input="getResult()" @keypress.enter.prevent="getResult()">
            <div class="bg-light" style="padding: 7px" @click="deleteQuery()" v-if="query">
                <i class="fa fa-times"></i>
            </div>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
            <div class="bg-light search-results" v-if="query">
                <div v-if="searchResults.length">
                    <div class="px-4" v-for="searchResult in searchResults" :key="searchResult.id">
                        <Service :service="searchResult"></Service>
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
    import Service from "./Service"

    export default {
        data() {
            return {
                query: Object.values(this.$route.query).join(''),
            }
        },
        computed: {
            ...mapGetters([
                'searchResults'
            ])
        },
        components: {
            Service
        },
        mounted() {
            // console.log(this.$route.query.reduce(function (sum, char) {
            //     return sum + char;
            // }), '');
        },
        methods: {
            getResult() {
                this.$store.dispatch('makeSearch', {query: this.query});
            },
            deleteQuery() {
                this.query = null;
            },
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

    .input-group {
        z-index: 9999;
    }

    /*input {*/
    /*    z-index: 9999;*/
    /*}*/


</style>