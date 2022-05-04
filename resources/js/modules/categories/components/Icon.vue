<template>
    <span v-html="html"></span>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        props: ['icon_id'],
        computed: {
            ...mapGetters([
                'categories',
                'can',
                'icon_types'
            ]),
            html: function () {
                if (this.icon_id) {
                    let icon_type = this.icon_types
                        .find(icon_type => icon_type.icons
                            .find(icon => icon.id == this.icon_id));
                    return icon_type.template.replace('$source', icon_type.icons
                        .find(icon => icon.id == this.icon_id).source);
                }
                if (this.icon_id === undefined) {
                    return '';
                }
                return '<i class="text-primary fa fa-heartbeat"></i>';
            }
        }
    }
</script>