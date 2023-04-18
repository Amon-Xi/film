<template>
  <div> 
    <div class="p-3 d-flex col-4 ">

      
        <input class="form-control me-2 " type="search" placeholder="Keress egy filmre..." aria-label="Search">
        <button class="btn btn-outline-danger d-flex" type="submit">Keresés</button>
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
