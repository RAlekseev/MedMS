<template>
    <div>
        <Summary/>
        <NoScrollBackground/>
        <Procedure/>
        <Hospital/>
        <FullHospital/>
        <Ambulance/>
        <Operations/>
        <Resuscitation/>
        <Lab/>
        <Physiotherapy/>
        <Carousel/>
        <Contacts/>


        <iframe :src="config_value('map_href')" v-if="config_value('map_href')"
                width="100%" height="500" frameborder="0"></iframe>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Carousel from "./Carousel";
    import Summary from "./Summary";
    import NoScrollBackground from "./NoScrollBackground";
    import Procedure from "./Procedure";
    import Hospital from "./Hospital";
    import Contacts from "../home/Contacts";
    import FullHospital from "./FullHospital";
    import Ambulance from "./Ambulance";
    import Operations from "./Operations";
    import Resuscitation from "./Resuscitation";
    import Lab from "./Lab";
    import Physiotherapy from "./Physiotherapy";

    export default {
        data() {
            return {
                description: 'О нас'
            }
        },
        metaInfo() {
            return {
                title: "О нас",
                meta: [{vmid: 'description', name: 'description', content: this.description}],
            }
        },
        computed: {
            ...mapGetters([
                'config_value',
            ])
        },
        components: {
            Carousel,
            Summary,
            NoScrollBackground,
            Procedure,
            Hospital,
            Contacts,
            FullHospital,
            Ambulance,
            Operations,
            Resuscitation,
            Lab,
            Physiotherapy,
        },
        mounted() {
            this.description = this.config_value('about_description')
        }
    };
</script>

<style scoped>
    @media (max-width: 768px) {
        ::v-deep .header {
            display: none;
        }
    }
</style>
