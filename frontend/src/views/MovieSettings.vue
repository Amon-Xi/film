
<template>
  <div>
    <div class="p-3 d-flex my-font">
      <h1>Filmek szerkeztése</h1>
    </div>

      <!-- New car -->
      <button
        type="button"
        class="btn btn-outline-success btn-sm ms-3"
        @click="onClickNew()"
      >
      <i class="bi bi-plus"></i>

        <!-- <i class="bi bi-bookmark-plus"> </i> -->
      </button>

    <div class="col-md-13 m-3 my-card">
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <div v-for="(film, index) in films" :key="`films${index}`">
          <div class="card my-font">
            <div class="card-body">
                <h5 class="card-title" > {{film.title}}</h5>
                <p class="card-text">Elkészítették:{{ film.production }}</p>
                <p class="card-text">Időtartam:{{ film.length }} perc</p>
                <p class="card-text">Bemutatatták:{{ film.presentation }}</p>

                <!-- törlés -->
                <button
                  type="button"
                  class="btn btn-outline-danger btn-sm"
                  @click="onClickDelete(film.id)"
                >
                <i class="bi bi-x"></i>
                </button>

                <!-- módosítás -->
                <button
                  type="button"
                  class="btn btn-outline-info btn-sm ms-2"
                  @click="onClickEdit(film.id)"
                >
                  <i class="bi bi-pencil-fill"></i>
                </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    

 
    <!--#region Modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              Film hozzáadása
            </h1>
            <button
              type="button"
              class="btn-close"
              @click="onClickCancel()"
              aria-label="Close"
            ></button>
          </div>

          <!--#region Modal body -->
          <div class="modal-body">
            <!--#region Form -->

            <form class="row g-3 needs-validation" novalidate>
              <!-- Autó név -->
              <div class="col-md-12">
                <label for="name" class="form-label">Film címe</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editableFilms.title"
                />
                <div class="invalid-feedback">A cím kitöltése kötelező</div>
              </div>

              <!-- Rendszám -->
              <div class="col-md-12">
                <label for="name" class="form-label">Ekkor készítették</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editableFilms.production"
                />
                <div class="invalid-feedback">A dátum kitöltése kötelező</div>
              </div>

              <!-- Rendszám -->
              <div class="col-md-12">
                <label for="name" class="form-label"
                  >A film időtartama (percben)</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editableFilms.length"
                />
                <div class="invalid-feedback">
                  Az időtartam kitöltése kötelező
                </div>
              </div>

              <!-- out of traffic -->
              <div class="col-md-12">
                <label for="name" class="form-label">Ekkor mutatták be</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editableFilms.presentation"
                />
                <div class="invalid-feedback">A dátum kitöltése kötelező</div>
              </div>
            </form>
            <!--#endregion Form -->
          </div>
          <!--#endregion Modal body -->

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              @click="onClickCancel()"
            >
              Mégse
            </button>
            <button
              type="button"
              class="btn btn-primary"
              @click="onClickSave()"
            >
              Mentés
            </button>
          </div>
        </div>
      </div>
    </div>
    <!--#endregion Modal -->
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { storeToRefs } from "pinia";
// import { useKeresStore } from "@/stores/keres";
import { useCounterStore } from "@/stores/counter";
import Counter from "@/components/Counter.vue";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
// const storeKeres = useKeresStore();
// const { keresoszo } = storeToRefs(storeKeres);
const storeCounter = useCounterStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

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

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      films: [],
      editableFilms: new FilmT(),
      modal: null,
      form: null,
      state: "view",
      currentId: null,
    };
  },
  mounted() {
    this.getFilms();
    // this.getFreeDriversAbc();
    // this.modal = new bootstrap.Modal(document.getElementById("modalCar"), {
    //   keyboard: false,
    // });

    this.form = document.querySelector(".needs-validation");
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
    async getFilmById(id) {
      let url = `${this.storeUrl.urlFilms}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableFilms = data.data;
    },

    // async getFreeDriversAbc() {
    //   let url = this.storeUrl.urlFreeDriversAbc;
    //   const config = {
    //     method: "GET",
    //     headers: {
    //       Authorization: `Bearer ${this.storeLogin.accessToken}`,
    //     },
    //   };
    //   const response = await fetch(url, config);
    //   const data = await response.json();
    //   this.driversAbc = data.data;
    // },

    async postFilm() {
      let url = this.storeUrl.urlFilms;
      const body = JSON.stringify(this.editableFilms);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getFilms();
    },
    async putFilm() {
      const id = this.editableFilms.id;
      let url = `${this.storeUrl.urlFilms}/${id}`;
      const body = JSON.stringify(this.editableFilms);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getFilms();
    },
    async deleteFilm(id) {
      let url = `${this.storeUrl.urlFilms}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getFilms();
    },
    // onClikRow(id) {
    //   this.currentId = id;
    // },
    onClickNew() {
      this.state = "new";
      this.currentId = null;
      this.editableFilms = new FilmT();
      // this.modal.show();
    },
    onClickDelete(id) {
      this.state = "delete";
      this.deleteFilm(id);
      this.currentId = null;
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getFilmById(id);
      // this.getFreeDriversAbc();
      // this.modal.show();
    },
    onClickCancel() {
      this.editableFilms = new FilmT();
      // this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          //put
          this.putFilm();
          // this.modal.hide();
        } else if (this.state == "new") {
          //post
          this.postFilm();
          // this.modal.hide();
        }
        // this.modal.hide();
        //frissíti a taxisok listáját
        // this.getFreeDriversAbc();
      }
    },
    // currentRowBackground(id) {
    //   return this.currentId == id ? "my-bg-current-row" : "";
    // },
    // outOfTrafficName(outOfTraffic) {
    //   return outOfTraffic ? "igen" : "nem";
    // },
  },
  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "Új film hozzáadása";
      } else if (this.state === "edit") {
        return "Film módosítása";
      }
    },
  },
};
</script>


<style>
.my-bg-current-row {
  background-color: lightgrey;
}
</style>
