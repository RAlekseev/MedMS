<template>
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
</template>

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
</style>