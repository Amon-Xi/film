<template>
  <div>
    <!-- SEARCH -->
    <div class="p-2 d-flex col-4">
      <input
        class="form-control ms-2 mt-3 me-3"
        type="search"
        placeholder="Keress egy filmre..."
        aria-label="Search"
        v-model="keresoszo"
      />
      <div class="mt-3">
        <button class="btn d-flex" type="submit" @click="onClickSearchButton()">
          <i class="mr-2 my-btn my-font"> Keresés</i>
        </button>
      </div>
    </div>

    <!-- CARD -->

    <div class="col-md-13 m-3 my-card">
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <div v-for="(film, index) in films" :key="`films${index}`">
          <div class="card my-font">
            <div class="card-body">
              <center>
                <h5 class="card-title" v-html="keresJelol(film.title)"></h5>

                <p class="card-text">Elkészítették: {{ film.production }}</p>
                <p class="card-text">Időtartam: {{ film.length }} perc</p>
                <p class="card-text">Bemutatatták: {{ film.presentation }}</p>
                <p class="card-text">
                  Film részlet: <a :href="film.links" target="_blank">
                    <i class="bi bi-box-arrow-up-right"></i
                  ></a>
                </p>
                <!-- Button trigger modal -->
                <button
                  type="button"
                  class="btn"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                  @click="onClickReszletek(film.id)"
                >
                  <i class="mr-2 my-btn"> Közreműködők</i>
                </button>
              </center>
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
      <div class="modal-dialog modal-xl modal-dialog">
        <div class="modal-content">
          <div class="modal-header my-modal">
            <h1
              class="modal-title fs-5 text-center my-font"
              id="exampleModalLabel"
            >
            
              {{ filmForModal.title }}

            
            </h1>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body my-modal">
            <div class="my-font">
              <center>
                <p>A film közreműködői:</p>
              </center>

              <div class="row row-cols-1 row-cols-md-6 g-4 my-persons-cards">
                <div
                  class="c"
                  v-for="(task, index) in filmForModal.tasks"
                  :key="`film_${index}`"
                >
                  <div class="card my-persons">
                    <img
                      :src="`../../public/persons/${task.Name}.jpg`"
                      class="card-img-top"
                      alt="..."
                    />
                    <div class="card-body">
                      <p class="card-text">
                        {{ task.Name }}<br />{{ task.Denomination }}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="modal-footer my-modal">
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
    this.embedding = null;
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
      this.filmForModal = data.data[0];
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
    videoEmbedding(links) {
      return `
      <iframe 
        width="560" height="315" 
        src="${links}" 
        title="YouTube video player" frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; 
        encrypted-media; gyroscope; picture-in-picture; 
        web-share" allowfullscreen>
      </iframe>
      
      `;
    },
  },
};
</script>

<style>
/* MODAL */

.card-title {
  background-color: rgba(255, 255, 255, 0.1);
  color: red;
  text-shadow: 2px 4px 4px rgba(46, 91, 173, 0.6);
}

.my-button {
  float: right;
}


.my-persons-cards {
  overflow-y: scroll;
  height: 500px;
}
.my-video {
  float: right;
}

.my-modal {
  background: #222;
  color: rgba(250, 250, 250, 0.8);
}



:root {
  --gradient: linear-gradient(
    to left top,
    rgb(255, 0, 85) 10%,
    #ff512f 90%
  ) !important;
}

.card {
  background: #222;
  border: 1px solid red;
  color: rgba(250, 250, 250, 0.8);
  margin-bottom: 2rem;
}

.my-btn {
  border: 5px solid;
  border-image-slice: 1;
  background: var(--gradient) !important;
  border-image-source: var(--gradient) !important;
  text-decoration: none;
  transition: all 0.4s ease;
}


</style>
