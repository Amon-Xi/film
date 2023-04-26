<template>
  <div>
    <!-- SEARCH -->
    <div class="p-3 d-flex col-4">
      <input
        class="form-control ms-2 mt-3 me-3"
        type="search"
        placeholder="Keress egy filmre..."
        aria-label="Search"
        v-model="keresoszo"
      />
      <div class="mt-3">
        <button
          class="btn btn-outline-danger d-flex"
          type="submit"
          @click="onClickSearchButton()"
        >
          Keresés
        </button>
      </div>
    </div>

    <!-- CARD -->

    <div class="col-md-13 mt-3 my-border">
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <div v-for="(film, index) in films" :key="`films${index}`">
          <div class="card " >
            <div class="card-body">
              <h5 class="card-title" v-html="keresJelol(film.title)"></h5>
              <p class="card-text">Elkészítették:{{ film.production }}</p>
              <p class="card-text">Időtartam:{{ film.length }} perc</p>
              <p class="card-text">Bemutatatták:{{ film.presentation }}</p>

              <!-- Button trigger modal -->
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                @click="onClickReszletek(film.id)"
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
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">
              {{filmForModal.title}}
            </h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div>
            <div class="row">
              <div class="col-md-7">
                <div class="row row-cols-1 row-cols-md-2 g-4">
                    <div class="card" >
                      <img src="..." class="card-img-top" alt="...">
                      <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      </div>
                    </div>
                  </div>
                <p>A film közreműködői:</p>
                kártyák
              </div>
              <div class="col-md-5">
                videó
              </div>
            </div>
            <!-- <table class="table">
              <thead>
                <tr>
                  <th scope="col">Név</th>
                  <th scope="col">Neme</th>
                  <th scope="col">Besorolás</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(task,index) in filmForModal.tasks" :key="`film_${index}`">
                  <td>{{task.Name}}</td>
                  <td>{{task.Gender}}</td>
                  <td>{{task.Denomination}}</td>
                  <td>Színész képe:</td>
                </tr>
              </tbody>
            </table> -->
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
class FilmT {
  constructor() {
    this.title = null;
    this.production = null;
    this.length = null;
    this.presentation = null;
    this.youtube = null;
    this.links = null;
    this.embeffing = null;
    this.tasks = [];
    
  }
}

import { storeToRefs } from "pinia";
// import { useKeresStore } from "@/stores/keres";
import { useCounterStore } from "@/stores/counter";
import * as bootstrap from "bootstrap";
import Counter from "@/components/Counter.vue";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
// const storeKeres = useKeresStore();
// const { keresoszo } = storeToRefs(storeKeres);
const storeCounter = useCounterStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
  data() {
    return {
      films: [],
      storeUrl,
      storeLogin,
      urlFilmFilter: "http://localhost:3000/getFilmFilter",
      keresoszo: null,
      filmForModal: new FilmT(),
      selectedFilmId: null,
    };
  },
  mounted() {
    this.getFilms();
    // this.getFilmsForModal();
  },
  watch: {
    // keresoszo(){
    //   if (this.keresoszo.trim()) {
    //     this.getFilmFilter();
    //   } else {
    //     this.getFilms();
    //   }
    // }
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
    async getFilmForModal(id) {
      let url = `${this.storeUrl.urlFilmOfTaskForModal}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.filmForModal = data.data;
    },
    async getFilmFilter() {
      const urlFilm = `${this.urlFilmFilter}/${this.keresoszo}`;
      const response = await fetch(urlFilm);
      const data = await response.json();
      this.films = data.data;
    },
    onClickReszletek(id) {
      // this.selectedFilmId = id;
      this.getFilmForModal(id);
    },
    onClickSearchButton() {
      if (this.keresoszo.trim()) {
        this.getFilmFilter();
      } else {
        this.getFilms();
      }
    },
    async getFilm() {
      const urlFilm = `${this.urlFilmFilter}/${this.title}`;
      const response = await fetch(urlFilm);
      const data = await response.json();
      this.filmT = data.data[0];
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
  },
};
</script>

<style>
.modal-backdrop {
  display: none;
}
.my-button {
  float: right;
}
</style>
