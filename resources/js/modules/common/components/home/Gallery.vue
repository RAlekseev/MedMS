<template>
    <div id="app" class="my-5">
        <div class="col-lg-12">
            <h2 class="tituloSeuAlbum h1"><b>Галерея</b></h2>
            <hr class="gallery_divider">
        </div>

        <div class="images" v-viewer>
        <vue-glide
                :autoplay="2000"
                type="carousel"
        >

            <vue-glide-slide v-for="src in photos" :key="src">

                <img :src="src" height="500px">

            </vue-glide-slide>

        </vue-glide>
        </div>
    </div>
</template>

<script>
    import { Glide, GlideSlide } from 'vue-glide-js'
    import 'vue-glide-js/dist/vue-glide.css'

    export default {
        data() {
            return {
                photos: [
                    'assets/img/gallery/1.jpg',
                    'assets/img/gallery/2.png',
                    'assets/img/gallery/3.jpg',
                    'assets/img/gallery/4.png',
                    'assets/img/gallery/5.jpg',
                    'assets/img/gallery/6.png',
                    'assets/img/gallery/7.jpg',
                    'assets/img/gallery/8.jpg',
                    'assets/img/gallery/9.jpg',
                    'assets/img/gallery/10.jpg',
                    'assets/img/gallery/11.jpg',
                    'assets/img/gallery/12.jpg',
                    'assets/img/gallery/13.png',
                    'assets/img/gallery/14.jpg',
                    'assets/img/gallery/15.jpg',
                    'assets/img/gallery/16.jpg',
                    'assets/img/gallery/17.jpg',
                    'assets/img/gallery/18.jpg',
                    'assets/img/gallery/19.jpg',
                    'assets/img/gallery/20.png',
                    'assets/img/gallery/21.jpg',
                    'assets/img/gallery/22.jpg',
                ]
            }
        },
        components: {
            [Glide.name]: Glide,
            [GlideSlide.name]: GlideSlide
        }
        // props:['photos'],
    }
</script>

<style>
    .glide__slide {
        width: auto!important;
    }

    .glide__bullet {
        height: 16px;
        width: 16px;
        background-color: lightgrey;
        border-radius: 100%;
        cursor: pointer;
        margin-right: 8px;

    }

    .glide__bullet--active {
        background: linear-gradient(270deg, lightgrey, darkgrey);
        background-size: 400% 400%;

        -webkit-animation: moveGradient 1.5s ease infinite;
        -moz-animation: moveGradient 1.5s ease infinite;
        animation: moveGradient 1.5s ease infinite;
    }

    @-webkit-keyframes moveGradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }
    @-moz-keyframes moveGradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }
    @keyframes moveGradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }

    .gallery_divider {
        margin-bottom: 50px;
        margin-top: 0;
        margin-left: 35%;
        width: 30%;
        height: 4px;
        color: burlywood;
    }

    .tituloSeuAlbum {
        text-align: center;
        color: burlywood;
    }
</style>