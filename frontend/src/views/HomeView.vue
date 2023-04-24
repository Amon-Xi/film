<template>
  <div>
    <!-- SEARCH -->
    <div class="p-3 d-flex col-4">
      <input
        class="form-control ms-2 mt-3 me-3"
        type="search"
        placeholder="Keress egy filmre..."
        aria-label="Search"
        v-model="storeKeres.keresoszo"
        >
      <div class="mt-3">
        <button class="btn btn-outline-danger d-flex " type="submit">
          Keresés
        </button>

      </div>
    </div>

    <!-- CARD -->


    <div class="col-md-13 mt-3 my-border">
      <div
        class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4"
      >
    <div  v-for="(film, index) in films" :key="`films${index}`">

      <div class="card ms-4 " style="width: 18rem">
        <div class="card-body " >
          <h5 class="card-title"  > Film címe: {{film.title}}</h5>
          <p class="card-text">Elkészítették:{{film.production}}</p>
          <p class="card-text">Időtartam:{{film.length}} perc</p>
          <p class="card-text">Bemutatatták:{{film.presentation}}</p>

          <!-- <p>Film részlet:<button type="button" class="btn btn-info">{{film.embedding}}</button>   </p> -->

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
            <h1 class="modal-title fs-5 text-center" id="exampleModalLabel" >
              Ide a film címe: 
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div v-for="(film, index) in filmsForModal" :key="`filmsForModal${index}`">
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
                  <td>Neve: </td>
                  <td>Neme: </td>
                  <td>Besorolása: </td>
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
class FilmTest {
  constructor() {
    this.title = null;
  }
}


import { useKeresStore } from "@/stores/keres";
const storeKeres = useKeresStore();
const { keresoszo } = storeToRefs(storeKeres);

import * as bootstrap from "bootstrap";
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();


import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
  data() {
    return {
      films: [],
      storeUrl,
      storeLogin,
      urlFilmFilter: "http://localhost:3000/getFilmFilter",
      filmTest: new FilmTest(),
      keresoszo
    };
  },
  mounted() {
    this.getFilms();
    this.getFilmsForModal();
  },
  watch: {
    keresoszo(){
      if (this.keresoszo.trim()) {
        this.getFilmFilter();
      } else {
        this.getHalkartyak();
      }
    }
  },

  methods: {
    async getFilms() {
      let url = this.storeUrl.urlFilms;
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
    async getFilmsForModal() {
      let url = this.storeUrl.urlFilmsForModal;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.filmsForModal = data.data;

  },
  keresJelol(text) {
      if (this.keresoszo) {
        let what = new RegExp(this.keresoszo, "gi");
        if (text) {
          text = text.replace(what, (match) => {
            return `<span class="mark">${match}</span>`;
          });
        }
        return text;
      } else {
        return text;
      }
    },
    async getFilmFilter() {
      const urlHalkartya = `${this.urlHalkartyakSzur}/${this.keresoszo}`;
      const response = await fetch(urlHalkartya);
      const data = await response.json();
      this.halak = data.data;
    },


}
};

</script>

<style>
 .modal-backdrop {
  display: none;
} 
.my-button{
  float: right;
}

</style>
