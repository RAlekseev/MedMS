<template>
    <div>
        <div id="carouselExampleIndicators" class="carousel slide mx-auto" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                </div>
                <div class="carousel-item">
                </div>
                <div class="carousel-item">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="main">
            <div class="section sec-about">
                <h1 class="hc-title text-primary">
                     «{{config_value('org_name')}}»
                </h1>
                <p>
                    Ведущий коммерческий многопрофильный клинический центр, осуществляющий оперативное лечение с
                    применением современных высокотехнологичных и малоинвазивных методов в условиях стационара.
                    <br>
                    <br>
                    Предоставляет уникальную возможность решения большинства проблем в одном центре, используя, прежде
                    всего, комплексный подход к лечению заболеваний и слаженное взаимодействие высококвалифицированных
                    специалистов различных профессий.
                    <br>
                    <br>
                    К нам обращаются пациенты в непростых ситуациях за консультациями или хирургической помощью высокой
                    степени сложности
                </p>
            </div>
            <div class="section sec-advantages">
                <h2 class="hc-title text-primary">Приемущества нашей Клиники</h2>
                <div class="hc-advantages-grid">
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Индивидуальный план лечения для каждого пациента" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/c33/two_people_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p style="width: 100%">Индивидуальный план лечения для каждого пациента</p>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Мультидисциплинарный подход" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/6d8/2man_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p>Мультидисциплинарный подход</p>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Оперативное лечение любого уровня сложности" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/a24/surgical_instruments_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p>Оперативное лечение любого уровня сложности</p>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Высокотехнологичные, малоинвазивные методы лечения" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/df0/high_tech_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p>Высокотехнологичные, малоинвазивные методы лечения</p>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Персональное врачебное наблюдение в послеоперационном периоде" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/30a/computer_ECG_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p>Персональное врачебное наблюдение в послеоперационном периоде</p>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-sm-4 hc-advantages-item">
                        <div class="hc-advantages-item-row">
                            <div class="hc-advantages-item-icon">
                                <img alt="Высококомфортабельные одно- и двухместные палаты" loading="lazy"
                                     src="https://www.fdoctor.ru/upload/iblock/229/person_sleeping_icon_50x50px.png">
                            </div>
                            <p class="hc-advantages-item-title"></p>
                            <p>Высококомфортабельные одно- и двухместные палаты</p>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section sec-address">
                <div class="contacts">
                    <div class="contacts-header">
                        <div class="contacts-header-item-right">
                            <p class="contacts-title hc-title text-primary">Контакты</p>
                        </div>
                        <div class="contacts-header-item-left">
                            <a class="contacts-phone" :href="'tel:'+config_value('org_phone')" title="Нажмите, чтобы позыонить по указанному номеру">
                                <span>{{config_value('org_phone')}}</span>
                            </a>
                            <ul class="contacts-address">
                                <li>{{config_value('org_address')}}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="contacts-map">
                        <h2>Мы находимся здесь!</h2>
                        <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3A2cec99a21c7004c647ea605a3b04cf89801af073e761874e44962cfd210c6163&amp;source=constructor" width="100%" height="471" frameborder="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {mapGetters} from "vuex";

    export default {
        metaInfo: {
            title: 'О нас'
        },
        computed: {
            ...mapGetters([
                'config_value',
            ])
        },
    };
</script>

<style scoped>
    #carouselExampleIndicators {
        position: relative;
        height: 400px;
        width: 100%;
    }
    #carouselExampleIndicators .carousel-inner {
        position: relative;
        height: 400px;
        width: 100%;
    }
    #carouselExampleIndicators .carousel-inner:before {
        position: absolute;
        content: '';
        background: rgba(0, 0, 0, 0.45);
    }
    #carouselExampleIndicators .carousel-inner .carousel-item {
        position: relative;
        height: 400px;
        width: 100%;
        background: url("https://thumbs.dreamstime.com/z/medicine-doctor-touching-electronic-medical-record-tablet-dna-digital-healthcare-network-connection-hologram-modern-virtual-154742526.jpg");
        background-position: center;
    }
    #carouselExampleIndicators .carousel-inner .carousel-item:nth-child(2) {
        position: relative;
        height: 400px;
        width: 100%;
        background: url("https://thumbs.dreamstime.com/z/healthcare-medicine-covid-doctor-holding-diagnose-virtual-human-lungs-coronavirus-spread-inside-modern-interface-179931168.jpg");
        background-position: center;
    }
    #carouselExampleIndicators .carousel-inner .carousel-item:nth-child(3) {
        position: relative;
        height: 400px;
        width: 100%;
        background: url("https://thumbs.dreamstime.com/z/medicine-doctor-stethoscope-hand-icon-insurance-health-medical-network-connection-virtual-screen-interface-148215134.jpg");
        background-position: center;
    }
    .section {
        margin-top: 60px;
        display: block;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        padding-left: 20px;
        padding-right: 20px;
        max-width: 1408px;
    }
    .hc-title {
        display: block;
        font-size: 33px;
    }
    p {
        margin: 20px 0;
        font-size: 1.4rem;
    }
    .hc-advantages-grid {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -15px
    }
    .hc-advantages-item {
        transition: outline 0s ease;
        outline: transparent solid 2px;
        margin: 15px;
        padding: 38px 30px;
        position: relative;
        background-color: white;
        box-shadow: 0.4em 0.4em 5px rgba(122,122,122,0.5);
        flex-basis: calc((100% / 3) - 30px);
    }
    .hc-advantages-item-row {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
    }
    .hc-advantages-item-icon img {
        width: 50px;
        min-width: 50px;
        height: 50px;
    }
    .hc-advantages-item-title {
        font-size: 16px;
        color: black;
        margin: 0 0 0 15px
    }
    .contacts-header{
        display: flex;
        -webkit-box-align: start;
        align-items: flex-start;
        -webkit-box-pack: justify;
        justify-content: space-between;
    }
    .contacts-phone{
        display: flex;
        align-items: center;
        -webkit-box-pack: end;
        justify-content: flex-end;
        color: black;
        font-size: 28px;
        margin: 0 0 15px;
        -webkit-box-align: center;
    }
    .contacts-phone a{
        text-decoration: none;
        transition: color 0.2s;
        padding: 0;
    }
    .contacts-address{
        color: black;
        margin: 0;
        padding: 0;
        font-size: 16px;
        text-align: right;
        border: 0;
        outline: 0;
        vertical-align: baseline;
        background: transparent;
    }
    .contacts-address li{
        list-style-type: none;
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        vertical-align: baseline;
        background: transparent;
    }
</style>
