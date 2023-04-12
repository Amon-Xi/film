
<template>
  
  <div class="background">
    <span></span>
    <span></span>
    <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <span></span>
   <div class="container-fluid my-container p-0">
   
   
   <!-- Carousel -->
   <Carousel />
   <!-- Menü -->
   <Menu />
   
   <RouterView />
  </div>
</div>
</template>

<script>
import Carousel from "@/components/Carousel.vue";
import Menu from "@/components/Menu.vue";
// import { useUrlStore } from "./stores/url";
// const storeUrl = useUrlStore();

export default {
  components: { Carousel, Menu },
};


</script>

<style>


@keyframes move {
    100% {
        transform: translate3d(0, 0, 1px) rotate(360deg);
    }
}

.background {
    position: fixed;
    width: 100vw;
    height: 100vh;
    top: 0;
    left: 0;
    background: #000000;
    overflow: hidden;
}

.background span {
    width: 1vmin;
    height: 1vmin;
    border-radius: 1vmin;
    backface-visibility: hidden;
    position: absolute;
    animation: move;
    animation-duration: 35;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
}


.background span:nth-child(0) {
    color: #8f24f9;
    top: 25%;
    left: 20%;
    animation-duration: 37s;
    animation-delay: -98s;
    transform-origin: 12vw -16vh;
    box-shadow: 2vmin 0 1.017509856986446vmin currentColor;
}
.background span:nth-child(1) {
    color: #0f2bff;
    top: 22%;
    left: 64%;
    animation-duration: 70s;
    animation-delay: -119s;
    transform-origin: 6vw -13vh;
    box-shadow: -2vmin 0 0.619439123775184vmin currentColor;
}
.background span:nth-child(2) {
    color: #8f24f9;
    top: 70%;
    left: 67%;
    animation-duration: 67s;
    animation-delay: -20s;
    transform-origin: 23vw 14vh;
    box-shadow: -2vmin 0 0.7145169544268266vmin currentColor;
}
.background span:nth-child(3) {
    color: #0f2bff;
    top: 19%;
    left: 41%;
    animation-duration: 75s;
    animation-delay: -4s;
    transform-origin: 15vw 18vh;
    box-shadow: 2vmin 0 0.7382389811767209vmin currentColor;
}
.background span:nth-child(4) {
    color: #0f2bff;
    top: 4%;
    left: 50%;
    animation-duration: 28s;
    animation-delay: -117s;
    transform-origin: -17vw -4vh;
    box-shadow: 2vmin 0 1.1353537662537243vmin currentColor;
}
.background span:nth-child(5) {
    color: #0f2bff;
    top: 75%;
    left: 76%;
    animation-duration: 86s;
    animation-delay: -11s;
    transform-origin: -16vw 1vh;
    box-shadow: 2vmin 0 0.7585003580606478vmin currentColor;
}
.background span:nth-child(6) {
    color: #0f2bff;
    top: 65%;
    left: 39%;
    animation-duration: 11s;
    animation-delay: -87s;
    transform-origin: 11vw -6vh;
    box-shadow: 2vmin 0 0.9398475111830655vmin currentColor;
}
.background span:nth-child(7) {
    color: #8f24f9;
    top: 50%;
    left: 33%;
    animation-duration: 144s;
    animation-delay: -11s;
    transform-origin: 9vw -20vh;
    box-shadow: -2vmin 0 1.1583257151983102vmin currentColor;
}
.background span:nth-child(8) {
    color: #0f2bff;
    top: 36%;
    left: 53%;
    animation-duration: 10s;
    animation-delay: -41s;
    transform-origin: 25vw 12vh;
    box-shadow: -2vmin 0 0.2864250298954787vmin currentColor;
}
.background span:nth-child(9) {
    color: #0f2bff;
    top: 7%;
    left: 70%;
    animation-duration: 129s;
    animation-delay: -6s;
    transform-origin: 13vw -18vh;
    box-shadow: 2vmin 0 0.6937737090006926vmin currentColor;
}
.background span:nth-child(10) {
    color: #24ffda;
    top: 94%;
    left: 22%;
    animation-duration: 85s;
    animation-delay: -128s;
    transform-origin: 8vw -16vh;
    box-shadow: 2vmin 0 1.0787425464398452vmin currentColor;
}
.background span:nth-child(11) {
    color: #24ffda;
    top: 38%;
    left: 5%;
    animation-duration: 38s;
    animation-delay: -86s;
    transform-origin: -18vw -5vh;
    box-shadow: 2vmin 0 1.1276438987276052vmin currentColor;
}
.background span:nth-child(12) {
    color: #8f24f9;
    top: 73%;
    left: 12%;
    animation-duration: 142s;
    animation-delay: -66s;
    transform-origin: -16vw 8vh;
    box-shadow: -2vmin 0 1.13702636022471vmin currentColor;
}
.background span:nth-child(13) {
    color: #24ffda;
    top: 40%;
    left: 16%;
    animation-duration: 117s;
    animation-delay: -40s;
    transform-origin: 5vw 3vh;
    box-shadow: -2vmin 0 0.6203095082826124vmin currentColor;
}
.background span:nth-child(14) {
    color: #24ffda;
    top: 37%;
    left: 45%;
    animation-duration: 147s;
    animation-delay: -62s;
    transform-origin: 21vw 2vh;
    box-shadow: 2vmin 0 1.1837238676710526vmin currentColor;
}
.background span:nth-child(15) {
    color: #8f24f9;
    top: 60%;
    left: 87%;
    animation-duration: 105s;
    animation-delay: -62s;
    transform-origin: 20vw -1vh;
    box-shadow: -2vmin 0 1.0515848803464822vmin currentColor;
}
.background span:nth-child(16) {
    color: #0f2bff;
    top: 94%;
    left: 63%;
    animation-duration: 23s;
    animation-delay: -77s;
    transform-origin: 12vw -15vh;
    box-shadow: 2vmin 0 0.6575540281382233vmin currentColor;
}
.background span:nth-child(17) {
    color: #24ffda;
    top: 46%;
    left: 21%;
    animation-duration: 108s;
    animation-delay: -7s;
    transform-origin: -7vw 20vh;
    box-shadow: 2vmin 0 0.7965841564394096vmin currentColor;
}
.background span:nth-child(18) {
    color: #0f2bff;
    top: 68%;
    left: 17%;
    animation-duration: 133s;
    animation-delay: -124s;
    transform-origin: 14vw 6vh;
    box-shadow: 2vmin 0 0.6041629315327972vmin currentColor;
}
.background span:nth-child(19) {
    color: #8f24f9;
    top: 38%;
    left: 80%;
    animation-duration: 89s;
    animation-delay: -70s;
    transform-origin: -17vw 18vh;
    box-shadow: 2vmin 0 0.9470045876577335vmin currentColor;
}
.background span:nth-child(20) {
    color: #8f24f9;
    top: 51%;
    left: 32%;
    animation-duration: 143s;
    animation-delay: -46s;
    transform-origin: 24vw 24vh;
    box-shadow: 2vmin 0 0.8032395307662843vmin currentColor;
}
.background span:nth-child(21) {
    color: #24ffda;
    top: 63%;
    left: 89%;
    animation-duration: 53s;
    animation-delay: -40s;
    transform-origin: -23vw -11vh;
    box-shadow: -2vmin 0 1.1713196825395251vmin currentColor;
}
.background span:nth-child(22) {
    color: #0f2bff;
    top: 26%;
    left: 94%;
    animation-duration: 39s;
    animation-delay: -115s;
    transform-origin: -24vw -7vh;
    box-shadow: -2vmin 0 0.7854338694173348vmin currentColor;
}
.background span:nth-child(23) {
    color: #8f24f9;
    top: 78%;
    left: 17%;
    animation-duration: 26s;
    animation-delay: -62s;
    transform-origin: 14vw 16vh;
    box-shadow: 2vmin 0 0.9314845386278567vmin currentColor;
}
.background span:nth-child(24) {
    color: #24ffda;
    top: 9%;
    left: 71%;
    animation-duration: 38s;
    animation-delay: -138s;
    transform-origin: -12vw -24vh;
    box-shadow: -2vmin 0 0.38584165468294773vmin currentColor;
}
.background span:nth-child(25) {
    color: #0f2bff;
    top: 56%;
    left: 26%;
    animation-duration: 12s;
    animation-delay: -130s;
    transform-origin: -5vw 14vh;
    box-shadow: 2vmin 0 0.786536238438686vmin currentColor;
}
.background span:nth-child(26) {
    color: #8f24f9;
    top: 28%;
    left: 11%;
    animation-duration: 9s;
    animation-delay: -102s;
    transform-origin: -3vw 2vh;
    box-shadow: 2vmin 0 0.8302442358986726vmin currentColor;
}
.background span:nth-child(27) {
    color: #8f24f9;
    top: 69%;
    left: 40%;
    animation-duration: 117s;
    animation-delay: -147s;
    transform-origin: -7vw 23vh;
    box-shadow: -2vmin 0 0.30516858512692013vmin currentColor;
}
.background span:nth-child(28) {
    color: #24ffda;
    top: 89%;
    left: 90%;
    animation-duration: 119s;
    animation-delay: -124s;
    transform-origin: -5vw 23vh;
    box-shadow: -2vmin 0 0.6969759319911344vmin currentColor;
}
.background span:nth-child(29) {
    color: #0f2bff;
    top: 88%;
    left: 61%;
    animation-duration: 146s;
    animation-delay: -34s;
    transform-origin: 11vw -8vh;
    box-shadow: 2vmin 0 0.5608194658349521vmin currentColor;
}
.background span:nth-child(30) {
    color: #24ffda;
    top: 65%;
    left: 17%;
    animation-duration: 154s;
    animation-delay: -143s;
    transform-origin: 17vw 5vh;
    box-shadow: 2vmin 0 1.0036267701675663vmin currentColor;
}
.background span:nth-child(31) {
    color: #8f24f9;
    top: 27%;
    left: 47%;
    animation-duration: 6s;
    animation-delay: -64s;
    transform-origin: 12vw -24vh;
    box-shadow: 2vmin 0 1.187760387699908vmin currentColor;
}
.background span:nth-child(32) {
    color: #0f2bff;
    top: 75%;
    left: 21%;
    animation-duration: 151s;
    animation-delay: -124s;
    transform-origin: -10vw -11vh;
    box-shadow: -2vmin 0 0.9968102806497643vmin currentColor;
}
.background span:nth-child(33) {
    color: #8f24f9;
    top: 28%;
    left: 37%;
    animation-duration: 41s;
    animation-delay: -79s;
    transform-origin: 14vw 11vh;
    box-shadow: -2vmin 0 1.0389091636803642vmin currentColor;
}
.background span:nth-child(34) {
    color: #0f2bff;
    top: 27%;
    left: 58%;
    animation-duration: 28s;
    animation-delay: -107s;
    transform-origin: -8vw 7vh;
    box-shadow: 2vmin 0 0.5889074389978555vmin currentColor;
}
.background span:nth-child(35) {
    color: #24ffda;
    top: 44%;
    left: 58%;
    animation-duration: 76s;
    animation-delay: -7s;
    transform-origin: -8vw 17vh;
    box-shadow: -2vmin 0 1.0646162406096347vmin currentColor;
}
.background span:nth-child(36) {
    color: #8f24f9;
    top: 29%;
    left: 97%;
    animation-duration: 147s;
    animation-delay: -66s;
    transform-origin: 22vw -24vh;
    box-shadow: -2vmin 0 1.132806784980762vmin currentColor;
}
.background span:nth-child(37) {
    color: #0f2bff;
    top: 66%;
    left: 60%;
    animation-duration: 111s;
    animation-delay: -30s;
    transform-origin: -9vw 25vh;
    box-shadow: -2vmin 0 0.861351988433168vmin currentColor;
}
.background span:nth-child(38) {
    color: #0f2bff;
    top: 45%;
    left: 81%;
    animation-duration: 40s;
    animation-delay: -5s;
    transform-origin: -10vw 24vh;
    box-shadow: 2vmin 0 1.1847105470608243vmin currentColor;
}
.background span:nth-child(39) {
    color: #0f2bff;
    top: 71%;
    left: 61%;
    animation-duration: 114s;
    animation-delay: -108s;
    transform-origin: 15vw 13vh;
    box-shadow: 2vmin 0 0.7288885159696992vmin currentColor;
}
.background span:nth-child(40) {
    color: #8f24f9;
    top: 46%;
    left: 59%;
    animation-duration: 145s;
    animation-delay: -76s;
    transform-origin: -10vw 25vh;
    box-shadow: 2vmin 0 0.900990851354573vmin currentColor;
}
.background span:nth-child(41) {
    color: #24ffda;
    top: 46%;
    left: 26%;
    animation-duration: 75s;
    animation-delay: -130s;
    transform-origin: -8vw -16vh;
    box-shadow: -2vmin 0 0.730200769914044vmin currentColor;
}
.background span:nth-child(42) {
    color: #8f24f9;
    top: 64%;
    left: 52%;
    animation-duration: 92s;
    animation-delay: -142s;
    transform-origin: 9vw 20vh;
    box-shadow: 2vmin 0 0.3084795804728364vmin currentColor;
}
.background span:nth-child(43) {
    color: #8f24f9;
    top: 18%;
    left: 85%;
    animation-duration: 13s;
    animation-delay: -127s;
    transform-origin: 17vw -5vh;
    box-shadow: -2vmin 0 0.7554635069368625vmin currentColor;
}
.background span:nth-child(44) {
    color: #8f24f9;
    top: 71%;
    left: 12%;
    animation-duration: 101s;
    animation-delay: -36s;
    transform-origin: 13vw -14vh;
    box-shadow: -2vmin 0 1.1789102675884136vmin currentColor;
}
.background span:nth-child(45) {
    color: #24ffda;
    top: 94%;
    left: 22%;
    animation-duration: 47s;
    animation-delay: -7s;
    transform-origin: 15vw 19vh;
    box-shadow: 2vmin 0 0.9406377822876753vmin currentColor;
}
.background span:nth-child(46) {
    color: #0f2bff;
    top: 58%;
    left: 31%;
    animation-duration: 81s;
    animation-delay: -68s;
    transform-origin: -7vw 12vh;
    box-shadow: 2vmin 0 1.0660385140906559vmin currentColor;
}
.background span:nth-child(47) {
    color: #8f24f9;
    top: 21%;
    left: 42%;
    animation-duration: 137s;
    animation-delay: -144s;
    transform-origin: -13vw -8vh;
    box-shadow: 2vmin 0 1.0771763025001504vmin currentColor;
}
.background span:nth-child(48) {
    color: #24ffda;
    top: 97%;
    left: 6%;
    animation-duration: 128s;
    animation-delay: -21s;
    transform-origin: 3vw -3vh;
    box-shadow: 2vmin 0 0.6882662255650032vmin currentColor;
}
.background span:nth-child(49) {
    color: #24ffda;
    top: 58%;
    left: 6%;
    animation-duration: 77s;
    animation-delay: -36s;
    transform-origin: -2vw -23vh;
    box-shadow: -2vmin 0 0.6902457523779297vmin currentColor;
}

</style>

