<template>
    <div class="bg-primary py-5">
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
                    {name: 'Bla bla', logo: 'storage/partners/1.png'},
                    {name: '2Bla bla', logo: 'storage/partners/2.png'},
                    {name: '3Bla bla', logo: 'storage/partners/3.webp'},
                    {name: 'Bla bla', logo: 'storage/partners/3.webp'},
                    {name: 'Bla bla', logo: 'storage/partners/2.png'},
                    {name: 'Bla bla', logo: 'storage/partners/1.png'},
                    {name: 'Bla bla', logo: 'storage/partners/3.webp'},
                    {name: 'Bla bla', logo: 'storage/partners/2.png'},
                    {name: 'Bla bla', logo: 'storage/partners/1.png'},
                    {name: 'Bla bla', logo: 'storage/partners/1.png'},
                    {name: '2Bla bla', logo: 'storage/partners/2.png'},
                ]
            }
        }
    }
</script>