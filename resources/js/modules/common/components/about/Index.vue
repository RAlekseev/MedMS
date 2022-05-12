<template>
    <div>
        <Summary/>
        <NoScrollBackground/>
        <Procedure/>
        <Hospital/>
        <FullHospital/>
        <Ambulance/>
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

    export default {
        metaInfo: {
            title: 'О нас'
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
