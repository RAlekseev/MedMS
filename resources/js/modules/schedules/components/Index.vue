<template>

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">
                Расписание
<!--                <Create @create="onCreate($event)" v-if="can('roles-create')"></Create>-->
            </h6>
        </div>

        <div class="card-body">
            <Schedule></Schedule>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from 'vuex'

    import Schedule from "../../../core/components/Schedule";

    export default {
        computed: {
            ...mapGetters([
                'can',
            ])
        },
        components: {
            Schedule,
        },
        mounted() {
            // this.$store.dispatch('getRoles');
            // this.$store.dispatch('getPermissions');
        },
        methods: {
            // deleteRole(id) {
            //     if (this.can('roles-delete')) {
            //         this.$store.dispatch('deleteRole', id)
            //     }
            // },
        },
    }
</script>
