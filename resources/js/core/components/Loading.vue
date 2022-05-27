<template>
    <div class="text-center">
        <div class="preloader">
        <div class="loader loader-inner-1">
            <div class="loader loader-inner-2">
                <div class="loader loader-inner-3">
                </div>
            </div>
        </div>
        </div>
    </div>
</template>

<style>
    .preloader{
        height: 500%;
        width: 100%;
        display: flex;
        flex-flow: column wrap;
        justify-content: center;
        align-content: center;
        align-items: center;
        perspective: 700;
    }
    .loader{
        text-align: center;
        margin: 5px;
        border-radius: 50%;
        border: 4px solid var(--primary);
        display: flex;
        flex-flow: column wrap;
        justify-content: center;
        align-content: center;
        align-items: center;
        transform-style: preserve-3d;
        position: relative;
    }
    .loader-inner-1{
        animation-delay: 0.2s;
        animation: change_first_circle 2s ease-in-out infinite;
    }
    .loader-inner-2{
        animation-delay: 0.2s;
        animation: change_second_circle 2s ease-in-out infinite;
    }
    .loader-inner-3{
        animation-delay: 0.2s;
        width: 50px;
        height: 50px;
        animation: change_last_circle 3s linear infinite;
    }
    @keyframes change_first_circle {
        50%{ transform: rotateX(360deg) scale(0.8); }
    }
    @keyframes change_second_circle {
        50%{ transform: rotateY(360deg) scale(0.8); }
    }
    @keyframes change_last_circle {
        50%{ transform: rotateX(360deg) scale(0.8); }
    }
</style>