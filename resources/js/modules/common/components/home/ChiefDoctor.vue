<template>
    <div class="chief-doctor">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <div class="card text-left ">
                    <h2 class="">{{config_value('chief_doctor_name')}}</h2>
                    <h3 class=""><b>Главный Врач</b></h3>
                    <h4 class="">"{{config_value('chief_doctor_speech')}}</h4>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        computed: {
            ...mapGetters(['config_value'])
        }
    }
</script>

<style scoped>
    .chief-doctor {
        background-image: url("/assets/img/chief_doctor.jpg");
        background-repeat: no-repeat;
        background-size: 100% auto;
    }
    .card {
        margin: 5rem;
        max-width: 70%;
        padding: 2rem;
    }

    @media (max-width: 950px) {
        .card {
            margin: 3rem;
            max-width: 80%;
            max-height: 90%
        }

        h2 {
            font-size: 22px;
        }
        h3 {
            font-size: 20px;
        }
        h4 {
            font-size: 18px;
        }
    }

    @media (max-width: 650px) {
        .card {
            padding: 0.5rem;
            margin: 1rem;
            max-width: 90%;
            max-height: 90%
        }

        h2 {
            font-size: 19px;
        }
        h3 {
            font-size: 18px;
        }
        h4 {
            font-size: 16px;
        }
    }
    @media (max-width: 410px) {
        .card {
            border-radius: 0;
            padding: 0.1rem;
            margin: 0;
            max-width: 100%;
            max-height: 100%
        }

        h2 {
            font-size: 17px;
        }
        h3 {
            font-size: 16px;
        }
        h4 {
            font-size: 15px;
        }
    }
</style>