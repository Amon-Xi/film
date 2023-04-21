<template>
  <div>
    <!-- SEARCH -->
    <div class="p-3 d-flex col-4">
      <input
        class="form-control ms-2 mt-3 me-3"
        type="search"
        placeholder="Keress egy filmre..."
        aria-label="Search"
      />
      <button class="btn btn-outline-danger d-flex" type="submit">
        Keresés
      </button>
    </div>

    <!-- CARD -->
    <div class="row m-0">
      <div class="col-md-12 my-border">
        <div
          class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4"
        >
        <div class="card">

          <div class="card-body">
            <h5 class="card-title">Film címe:</h5>
            <p class="card-text">Elkészítettéke:</p>
            <p class="card-text">Időtartam:</p>
            <p class="card-text">Bemutatatták:</p>
            
            <!-- Button trigger modal -->
            <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#exampleModal"
            >
            <i class="bi bi-arrow-90deg-right"></i>
          </button>
        </div>
      </div>
    </div>
      </div>
    </div>

    <!-- MODAL -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">
              Ide a film címe:
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">            
            <p>Videó ide: (Nincs videó akkor valami ikont)</p>
            <p>Emberek akik részt vettek a forgatásban:</p>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Név</th>
                  <th scope="col">Neme</th>
                  <th scope="col">Besorolás</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Neve:</td>
                  <td>Neme:</td>
                  <td>Besorolása:</td>
                  <td>Színész képe:</td>
                </tr>
              </tbody>
            </table>

          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Bezárás
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
class Film {
  constructor(){
  this.id = null
  this.title = null
  this.production = null
  this.length = null
  this.presentation = null
  this.youtube = null

  }
}


import * as bootstrap from "bootstrap";
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();

export default {
  data() {
    return {
      films: [],
      urlFilmek: "http://localhost:3000/films",
      film: new Films(),
      keresoszo,

      storeUrl,
      storeLogin,
    };
  },
  mounted() {
    this.getMovies();
  },
  methods: {
    async getMovies() {
      const response = await fetch(this.urlFilmek);
      const data = await response.json();
      this.films = data.data;
  },
}
}
</script>

<style>
.modal-backdrop {
  display: none;
}

.modal-body {
  max-height: calc(100vh - 180px);
  overflow-y: auto;
}
</style>
