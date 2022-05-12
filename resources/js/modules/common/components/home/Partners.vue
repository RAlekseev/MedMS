<template>
    <div class="partners py-5">
        <h2 class="h1 text-white text-center py-3"><b>Наши партнеры</b></h2>
        <div class="row">
            <div class="col text-center" v-for="partner in partners">
                <img :src="partner.logo" height="150px" width="auto" class="mx-4">
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                partners: [
                    {name: 'Bla bla', logo: 'assets/img/partners/1.png'},
                    {name: '2Bla bla', logo: 'assets/img/partners/2.png'},
                    {name: '3Bla bla', logo: 'assets/img/partners/3.webp'},
                    {name: 'Bla bla', logo: 'assets/img/partners/3.webp'},
                    {name: 'Bla bla', logo: 'assets/img/partners/2.png'},
                    {name: 'Bla bla', logo: 'assets/img/partners/1.png'},
                    {name: 'Bla bla', logo: 'assets/img/partners/3.webp'},
                    {name: 'Bla bla', logo: 'assets/img/partners/2.png'},
                    {name: 'Bla bla', logo: 'assets/img/partners/1.png'},
                    {name: 'Bla bla', logo: 'assets/img/partners/1.png'},
                    {name: '2Bla bla', logo: 'assets/img/partners/2.png'},
                ]
            }
        }
    }
</script>

<style scoped>
    @keyframes gradient {
        0% {
            background-position: 0% 25%;
        }
        25% {
            background-position: 25% 50%;
        }
        50% {
            background-position: 50% 75%;
        }
        75% {
            background-position: 100% 75%;
        }
        100% {
            background-position: 0% 25%;
        }
    }

    .partners {
        padding: 1rem;
        height: 100%;
        background: linear-gradient(-45deg, #01411C, #00703C, #043927, #006432 60%);
        background-size: 400% 400%;
        animation: gradient 10s ease-in-out infinite;
        /*background: linear-gradient(135deg, #e55d87 0%, #5fc3e4 100%);*/


    }
</style>