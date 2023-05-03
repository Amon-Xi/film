
<template>
  <div>
    <div class="m-3 my-font">
      <h1>Filmek szerkeztése</h1>
    </div>

    <!-- TABLE -->

    <div class="row">
      <div class="col-6">
        <h2 class="ms-3">Filmek</h2>

        <table class="table table-bordered table-hover w-auto ms-3 my-table">
          <thead>
            <tr>
              <th>
                <!-- New Film -->
                <button
                  type="button"
                  class="btn btn-outline-info btn-sm ms-3"
                  @click="onClickNew()"
                >
                  <i class="bi bi-plus"></i>
                </button>
              </th>
              <th>Címe</th>
              <th>Elkészítették</th>
              <th>Időtartam (perc)</th>
              <th>Bemutatatták</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(film, index) in films"
              :key="`film${index}`"
              :class="currentRowBackground(film.id)"
              @click="onClickFilmRow(film.id)"
            >
              <td class="text-nowrap">
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
                  class="btn btn-outline-success btn-sm ms-2"
                  @click="onClickEdit(film.id)"
                >
                  <i class="bi bi-pencil-fill"></i>
                </button>
              </td>

              <td>{{ film.title }}</td>
              <td>{{ film.production }}</td>
              <td>{{ film.length }}</td>
              <td>{{ film.presentation }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="col-6" v-if="filmPerson.tasks.length">
        <div class="sticky-top">
          <h2 class="ms-3">{{ filmPerson.title }} közreműködői</h2>
          <div class="my-scroll">

          
          <table class="table table-bordered table-hover w-auto ms-3 my-table  ">
            <thead>
              <tr>
                <th>
                  <!-- New Film -->
                  <button
                    type="button"
                    class="btn btn-outline-info btn-sm ms-3"
                    @click="onClickNew()"
                  >
                    <i class="bi bi-plus"></i>
                  </button>
                </th>
                <th>Név</th>
                <th>Besoroloása</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="(task, index) in filmPerson.tasks"
                :key="`task${index}`"
              >
                <td class="text-nowrap">
                  <!-- törlés -->
                  <button
                    type="button"
                    class="btn btn-outline-danger btn-sm"
                    @click="onClickDelete(task.id)"
                  >
                    <i class="bi bi-x"></i>
                  </button>

                  <!-- módosítás -->
                  <button
                    type="button"
                    class="btn btn-outline-success btn-sm ms-2"
                    @click="onClickEdit(task.id)"
                  >
                    <i class="bi bi-pencil-fill"></i>
                  </button>
                </td>

                <td class="text-nowrap">{{ task.Name }}</td>
                <td>{{ task.Denomination }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        </div>
      </div>
    </div>
    <!--#region Modal -->
    <div
      class="modal fade"
      id="filmModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header my-modal">
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
          <div class="modal-body my-modal">
            <!--#region Form -->

            <form class="row g-3 needs-validation" novalidate>
              <div class="col-md-12">
                <label for="name" class="form-label">Film címe</label>
                <input
                  type="text"
                  class="form-control"
                  id="title"
                  required
                  v-model="editableFilms.title"
                />
                <div class="invalid-feedback">A cím kitöltése kötelező</div>
              </div>

              <div class="col-md-12">
                <label for="name" class="form-label">Ekkor készítették</label>
                <input
                  type="text"
                  class="form-control"
                  id="production"
                  required
                  v-model="editableFilms.production"
                />
                <div class="invalid-feedback">A dátum kitöltése kötelező</div>
              </div>

              <div class="col-md-12">
                <label for="name" class="form-label"
                  >A film időtartama (percben)</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="length"
                  required
                  v-model="editableFilms.length"
                />
                <div class="invalid-feedback">
                  Az időtartam kitöltése kötelező
                </div>
              </div>

              <div class="col-md-12">
                <label for="name" class="form-label">Ekkor mutatták be</label>
                <input
                  type="text"
                  class="form-control"
                  id="presentation"
                  required
                  v-model="editableFilms.presentation"
                />
                <div class="invalid-feedback">A dátum kitöltése kötelező</div>
              </div>
            </form>
            <!--#endregion Form -->
          </div>
          <!--#endregion Modal body -->

          <div class="modal-footer my-modal">
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
  </div>

  <!--#endregion Modal -->
</template>

<script>
import * as bootstrap from "bootstrap";
import { storeToRefs } from "pinia";
import { useCounterStore } from "@/stores/counter";
import Counter from "@/components/Counter.vue";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeCounter = useCounterStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class FilmT {
  constructor(
    id = 0,
    title = null,
    production = null,
    length = null,
    presentation = null,
    youtube = null,
    links = null,
    embedding = null,
    tasks = []
  ) {
    this.id = id;
    this.title = title;
    this.production = production;
    this.length = length;
    this.presentation = presentation;
    this.youtube = youtube;
    this.links = links;
    this.embedding = embedding;
    this.tasks = tasks;
  }
}
class filmPerson {
  constructor(
    id = 0,
    title = null,
    production = null,
    length = null,
    presentation = null,
    youtube = null,
    links = null,
    embedding = null,
    tasks = [],
    personId = 0,
    filmId = 0,
    denomination = null,
    name = null
  ) {
    this.id = id;
    this.title = title;
    this.production = production;
    this.length = length;
    this.presentation = presentation;
    this.youtube = youtube;
    this.links = links;
    this.embedding = embedding;
    this.tasks = tasks;
    this.personId = personId;
    this.filmId = filmId;
    this.denomination = denomination;
    this.name = name;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      films: [],
      editableFilms: new FilmT(),
      form: null,
      state: "view",
      currentId: null,
      currentDataId: null,
      filmPerson: new filmPerson(),
    };
  },
  mounted() {
    this.getFilms();
    // this.getFreeDriversAbc();
    this.modal = new bootstrap.Modal(document.getElementById("filmModal"), {
      keyboard: false,
    });

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
    async getFilmPersons(id) {
      let url = `${this.storeUrl.urlFilmOfTaskForModal}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.filmPerson = data.data[0];
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
      this.modal.show();
    },
    onClickDelete(id) {
      this.state = "delete";
      this.deleteFilm(id);
      this.currentId = null;
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getFilmById(id);
      this.modal.show();
    },
    onClickCancel() {
      this.editableFilms = new FilmT();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          //put
          this.putFilm();
          this.modal.hide();
        } else if (this.state == "new") {
          //post
          this.postFilm();
          this.modal.hide();
        }
        this.modal.hide();
        //frissíti a taxisok listáját
        this.getFilms();
      }
    },
    onClickFilmRow(id) {
      console.log(id);
      this.currentDataId = null;
      this.currentId = id;
      this.getFilmPersons(id);
    },
    currentRowBackground(id) {
      return this.currentId == id ? "my-bg-current-row" : "";
    },
    outOfTrafficName(outOfTraffic) {
      return outOfTraffic ? "igen" : "nem";
    },
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
.my-table {
  background: #222;
  border: 2px ridge red;
  color: rgba(250, 250, 250, 0.8);
}
h2 {
  color: red;
}
.my-scroll {
  overflow-y: scroll;
  height: 95vh;
  width: 450px !important;
}
</style>
