<template>
    <div>
        <div class="main-section shadow">
            <div class="image"><img src="assets/img/home-page/doc.png"></div>
            <div class="textBox">
                <h2>«{{config_value('org_name')}}»</h2>
                <span>Многопрофильная клиника</span>
                <br/>
                <span>Индивидуальный подход к лечению</span>
                <br/>
                <router-link :to="{name: 'about'}" class="btn btn-rounded btn-amber bg-primary text-white mt-4">
                    Подробнее
                </router-link>
            </div>
        </div>
        <Categories class="my-3"/>
        <Employees/>
        <Gallery/>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";
    import Categories from "./Categories"
    import Employees from "./Employees";
    import Gallery from "./Gallery";

    export default {
        computed: {
            ...mapGetters([
                'config_value',
            ])
        },
        components: {
            Categories,
            Employees,
            Gallery,
        }
    }
</script>

<style scoped>
    .main-section {
        background-color: #f5f0ed;
        width: 100%;
        /*position: relative;*/
        align-items: center;
    }

    .textBox {
        position: relative;
    }

    .textBox h2 {
        color: #0a58ca;
        font-weight: bold;
    }

    .textBox span {
        align-items: center;
    }

    @media (min-width: 1025px) {
        .main-section {
            height: 45vh;
            display: flex;
        }

        img {
            float: right;
            height: 340px;
            width: 440px;
            padding-left: 100px;
        }

        .textBox {
            padding-left: 160px;
        }

        .textBox h2 {
            font-size: 2.5em;
            padding-left: 60px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 25px;
            padding-left: 70px;
        }

        .btn {
            margin-left: 70px;
        }
    }

    @media (min-width: 770px) and (max-width: 1025px) {
        .main-section {
            height: 50vh;
            display: flex;
        }

        img {
            float: right;
            height: 340px;
            width: 420px;
            padding-left: 80px;
        }

        .textBox h2 {
            font-size: 2em;
            padding-left: 60px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 20px;
            padding-left: 70px;
        }

        .btn {
            margin-left: 70px;
        }
    }

    @media (min-width: 427px) and (max-width: 769px) {
        .main-section {
            height: 70vh;
            display: flex;
        }

        img {
            float: right;
            height: 270px;
            width: 340px;
            padding-left: 80px;
        }

        .textBox {
            float: left;
            padding-top: 20px;
        }

        .textBox h2 {
            font-size: 1.5em;
            padding-left: 60px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 16px;
            padding-left: 70px;
        }

        .btn {
            margin-left: 70px;
        }
    }

    @media (min-width: 377px) and (max-width: 426px) {
        .main-section {
            height: 70vh;
        }

        img {
            height: 270px;
            width: 340px;
            padding-left: 80px;
        }

        .textBox {
            padding-top: 20px;
        }

        .textBox h2 {
            font-size: 1.7em;
            padding-left: 60px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 16px;
            padding-left: 70px;
        }

        .btn {
            margin-left: 70px;
        }
    }

    @media (min-width: 322px) and (max-width: 376px) {
        .main-section {
            height: 70vh;
        }

        img {
            height: 290px;
            width: 330px;
            align-items: center;
            padding-left: 50px;
        }

        .textBox {
            padding-top: 20px;
        }

        .textBox h2 {
            font-size: 1.7em;
            padding-left: 30px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 16px;
            padding-left: 30px;
        }

        .btn {
            margin-left: 30px;
        }
    }

    @media (max-width: 321px) {
        .main-section {
            height: 75vh;
        }

        img {
            margin-top: 20px;
            justify-content: center;
            height: 270px;
            width: 270px;
            align-items: center;
            margin-left: 20px;
        }

        .textBox {
            padding-top: 20px;
        }

        .textBox h2 {
            font-size: 1.5em;
            padding-left: 30px;
            padding-right: 10px;
        }

        .textBox span {
            align-items: center;
            font-size: 16px;
            padding-left: 30px;
        }

        .btn {
            margin-left: 30px;
        }
    }
</style>

