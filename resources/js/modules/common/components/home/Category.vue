<template>
    <div class="row m-3">
        <router-link v-for="sub_category in subCategories" :key="sub_category.id" :to="{name: `services`, params: {id: sub_category.id}}"
                     class="col-xs-12 col-sm-6 col-lg-4 my-3">
            <div class="card p-3  h-100">
                <div class="row h-100">
                    <div class="col-3 m-auto">
                        <Icon :icon_id="sub_category.icon_id"></Icon>
<!--                        <i class="fa fa-heartbeat fa-3x text-primary"></i>-->
                    </div>
                    <div class="col-9 m-auto">
                        <h5>
                            {{sub_category.name}}
                        </h5>
                    </div>
                </div>
            </div>
        </router-link>

        <a href="#" class="col-xs-12 col-sm-6 col-lg-4 my-3" @click.prevent="toggleCategory">
            <div class="card p-3  h-100">
                <div class="row h-100">
                    <div class="col-3 m-auto">
                        <i :class="'icon fa text-primary ' + (opened ? 'fa-minus' : 'fa-plus')"></i>
                    </div>
                    <div class="col-7 m-auto">
                        <h5 v-if="opened">
                            Скрыть
                        </h5>
                        <h5 v-else>
                            Показать еще <b>{{category.sub_categories.length - 5}}</b>
                        </h5>
                    </div>
                </div>
            </div>
        </a>
    </div>
</template>

<script>
    import Icon from "../../../categories/components/Icon";

    export default {
        data() {
            return {
                opened: false,
            }
        },
        props: ['category'],
        computed: {
            subCategories() {
                if (this.opened) {return this.category.sub_categories}
                else {return this.category.sub_categories.slice(0, 5)}
            }
        },
        methods: {
            toggleCategory() {
                this.opened = !this.opened
            }
        },
        components: {
            Icon,
        }

    }
</script>

