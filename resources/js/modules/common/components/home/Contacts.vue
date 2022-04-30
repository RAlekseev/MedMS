<template>
    <div class="contacts">
        <div class="text-center text-white">
            <h2 class="h1 m-3"><b>Наши контакты</b></h2>

            <div class="m-2" v-if="config_value('org_phone')">
                <a :href="'tel:'+config_value('org_phone')" class="phone text-white">
                    <div>
                        <i class="fa fa-phone-alt pr-2" aria-hidden="true"></i>
                        <span class="phone-desktop">{{config_value('org_phone')}}</span>
                    </div>
                </a>
            </div>
            <div class="m-2" v-if="config_value('second_org_phone')">
                <a :href="'tel:'+config_value('second_org_phone')" class="phone text-white">
                    <div>
                        <i class="fa fa-phone-alt pr-2" aria-hidden="true"></i>
                        <span class="phone-desktop">{{config_value('second_org_phone')}}</span>
                    </div>
                </a>
            </div>
            <div class="m-2" v-if="config_value('third_org_phone')">
                <a :href="'tel:'+config_value('third_org_phone')" class="phone text-white">
                    <div>
                        <i class="fa fa-phone-alt pr-2" aria-hidden="true"></i>
                        <span class="phone-desktop">{{config_value('third_org_phone')}}</span>
                    </div>
                </a>
            </div>
            <div class="m-2" v-if="config_value('ambulance')">
                <a :href="'tel:'+config_value('ambulance')" class="phone text-white">
                    <div>
                        <i class="fa fa-ambulance pr-2" aria-hidden="true"></i>
                        <span class="phone-desktop">{{config_value('ambulance')}}</span>
                    </div>
                </a>
            </div>

            <div class="m-2" v-if="config_value('org_address')">
                <a :href="'tel:'+config_value('org_address')" class="phone text-white">
                    <div>
                        <i class="fa fa-location-arrow pr-2" aria-hidden="true"></i>
                        <span class="phone-desktop">{{config_value('org_address')}}</span>
                    </div>
                </a>
            </div>

            <div class="m-2">
                <a v-if="config_value('facebook_link')" :href="config_value('facebook_link')" target="_blank">
                    <img src="assets/img/social/Facebook.png" class="shedow-white shadow-10">
                </a>
                <a v-if="config_value('instagram_link')" :href="config_value('instagram_link')" target="_blank">
                    <img src="assets/img/social/Instagram.png">
                </a>
                <a v-if="config_value('telegram_link')" :href="config_value('telegram_link')" target="_blank">
                    <img src="assets/img/social/Telegram.png">
                </a>
                <a v-if="config_value('vk_link')" :href="config_value('vk_link')" target="_blank">
                    <img src="assets/img/social/VK.png">
                </a>
                <a v-if="config_value('whatsapp_link')" :href="config_value('whatsapp_link')" target="_blank">
                    <img src="assets/img/social/WhatsApp.png">
                </a>
            </div>

        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        computed: {
            ...mapGetters([
                'config_value',
            ])
        },
    }
</script>

<style scoped>
    .contacts {
        color: white !important;
        padding: 1rem;
        height: 100%;
        background: linear-gradient(rgba(135, 60, 255, 0.4), rgba(135, 60, 255, 0.0) 80%),
        linear-gradient(-45deg, rgba(120, 155, 255, 0.9) 25%, rgba(255, 160, 65, 0.9) 75%);
    }

    img {
        width: 3rem;
    }
</style>