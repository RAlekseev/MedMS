<template>
    <div class="row m-3">
    <div class="col-lg-4 card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Категории
            </h6>
        </div>
        <div class="card-body px-0">
            <ul>
                <li v-for="category in categories" :key="category.id">
                    <a href="#" :class="categoryColor(category.id)" @click.prevent="chooseCategory(category)">
                        {{category.name}}
                    </a>
                    <ul>
                        <li v-for="subCategory in category.sub_categories" :key="subCategory.id">
                            <a href="#" :class="categoryColor(subCategory.id)" @click.prevent="chooseCategory(subCategory)">
                                {{subCategory.name}}
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
        <div class="col-lg-8 card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                    Услуги
                </h6>
            </div>

            <div class="card-body">
<!--                <div class="table-responsive">-->
                        <div v-for="service in categoryServices()" :key="service.id">
                            <Service :service="service"></Service>
<!--                            <td>-->
<!--                                <router-link :to="{name: 'serviceShow', params: {id: service.id}}">-->
<!--                                    {{service.name}}-->
<!--                                </router-link>-->
<!--                            </td>-->
<!--                            <td>{{service.price}}</td>-->
<!--                            <td>{{service.category.name}}</td>-->
<!--                            <td>-->
<!--                                <ol>-->
<!--                                    <li v-for="child_service in service.child_services" :key="child_service.id">-->
<!--                                        {{child_service.name}}-->
<!--                                    </li>-->
<!--                                </ol>-->
<!--                            </td>-->
<!--                            <td>{{limitStr(service.description, 30)}}</td>-->
                        </div>
<!--                </div>-->
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Service from "./Service";

    export default {
        metaInfo: {
            title: 'Услуги'
        },
        data() {
            return {
                selected_category: {
                    id: 1
                },
            }
        },
        mounted() {
            this.$store.dispatch('getServices');
            this.$store.dispatch('getCategories');
        },
        computed: {
            ...mapGetters([
                'services',
                'categories',
            ])
        },
        components: {
            Service
        },
        methods: {
            chooseCategory(category) {
                this.selected_category = category;
            },
            categoryColor(category_id) {
                return this.selected_category?.id === category_id ? 'text-primary' : 'text-gray-500';
            },
            categoryServices() {
                return this.services.filter(service => service.category_id === this.selected_category.id ||
                service.category.category_id === this.selected_category.id);
            },
            limitStr(str, n) {
                return str.substr(0, n) + (str.length > n ? "..." : "");
            },
        }
    }

</script>