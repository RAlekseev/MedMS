<template>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Иконки
                <Create v-if="can('categories-create')"></Create>
            </h6>
        </div>

        <div class="card-body">
            <div v-for="icon_type in icon_types" :key="icon_type.id">
                <h2>{{icon_type.name}}</h2>
                <h3>
                    <a :href="icon_type.description" v-if="icon_type.description.slice(0, 4) == 'http'" target="_blank">
                        {{icon_type.description}}
                    </a>
                    <span v-else>
                        {{icon_type.description}}
                    </span>
                </h3>
                <IconType :icon_type="icon_type"></IconType>
            </div>
        </div>
    </div>
</template>


<script>
    import {mapGetters} from 'vuex'
    import IconType from "./IconType"

    export default {
        metaInfo: {
            title: 'Иконки'
        },
        computed: {
            ...mapGetters([
                'icon_types',
                'can',
            ])
        },
        components: {
            IconType,
        },
        mounted() {
            this.$store.dispatch('getIconTypes');
        },
        methods: {
            is_available_actions() {
                return this.can('icons-update') || this.can('icons-delete');
            },
        }
    }
</script>
