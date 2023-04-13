
<template>
  <div>
    <h1>Movies</h1>
  </div>
</template>

<script>
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();
export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      films: [],
    };
  },
  mounted() {
    this.getMovies();
  },
  methods: {
    async getMovies() {
      let url = this.storeUrl.urlFilms;
      console.log(url);
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.films = data.data;
    },
  },
};
</script>
<style>
</style>
