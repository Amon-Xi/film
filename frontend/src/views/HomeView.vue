<template>
  <div>
    <h1>Home</h1>

    

      
      <div v-for="(movie, index) in movieIdk" :key="`movie${index}`">
        <h2>
          Meleg vagy lol
          {{ movie.title }} ({{ movie.production }}) {{ movie.youtube }} 
        </h2>
      </div>
      

  </div>


</template>

<script setup>
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();
</script>

<style>

</style>
