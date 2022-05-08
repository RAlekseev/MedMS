<template>
    <div>
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><router-link to="/">Главная</router-link></li>
                <li class="breadcrumb-item"><router-link to="/services/index">Аптечный склад</router-link></li>
                <li class="breadcrumb-item active" aria-current="page">{{inventory.name}}</li>
            </ol>
        </nav>

    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        data() {
            return {
                inventory: {
                    id: 1,
                    name: 'Адреналин',
                    unit: 'ml',
                    amount: 50,
                }
            }
        },
        metaInfo: {
            title: "this.inventory.name"
        },
        mounted() {
            // this.$store.dispatch('getContract', this.$route.params.id);
            // this.$store.dispatch('getContractMedia');
        },
        computed: {
            // ...mapGetters([
            //     'contract',
            //     'doc_templates',
            // ])
        },
        components: {

        },
    }

</script>
