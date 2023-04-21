
<template>
  
   <div class="container-fluid box my-container p-0">
   
   <!-- CArousel -->
   <Carousel />
<!-- Men -->
   <Menu />
   
   <RouterView />
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
body{
    background-image: url(../images/hatter.png);
    background-repeat: no-repeat;
    background-attachment: fixed;
}

</style>

