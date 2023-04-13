
<template>
  <div>
    <h1>Movies</h1>

    <div class="d-flex col-5" role="search">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search for movies..."
            aria-label="Search"
          />
          <button class="btn btn-outline-info" type="submit">Search</button>
        </div>

    <div v-for="(movie, index) in movieIdk" :key="`movie${index}`">
      <h2>
        {{ movie.title }} {{ movie.production }} {{ movie.youtube }} 
      </h2>
    </div>
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
      movieIdk: [],
    };
  },
  mounted() {
    this.getMovies();
  },
  methods: {
    async getMovies() {
      let url = this.storeUrl.urlMovies;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.movieIdk = data.data;
    },
  },
};
</script>
<style>
</style>
