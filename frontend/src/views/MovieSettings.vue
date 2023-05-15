
<template>
  <div>
    <div class="row">
      <div class="col-6">
        <div class="m-3 my-font d-flex">
          <h1>Filmek szerkeztése</h1>
        </div>
      </div>
      <div class="col-6">
        <div class="p-2 d-flex col-12 col-sm-6 my-search">
          <input
            class="form-control ms-2 mt-3"
            type="search"
            placeholder="Keress egy filmre..."
            aria-label="Search"
            v-model="keresoszo"
          />
          <div class="mt-3">
            <button class="btn" type="submit" @click="onClickSearchButton()">
              <i class="mr-2 my-btn my-font"> Keresés</i>
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- TABLE -->

    <!-- FILMS -->
    <div class="row">
      <div class="col-6">
        <h2 class="ms-3 my-font">Filmek</h2>

        <table class="table table-bordered w-auto ms-3 my-table">
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

              <td v-html="keresJelol(film.title)"></td>
              <td>{{ film.production }}</td>
              <td>{{ film.length }}</td>
              <td>{{ film.presentation }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- PERSONS -->
      <div class="col-6" v-if="filmPerson.tasks.length">
        <div class="sticky-top">
          <h2 class="ms-3 my-font">{{ filmPerson.title }} film közreműködői</h2>
          <div class="my-scroll">
            <table class="table table-bordered w-auto ms-3 my-table mt-3">
              <thead>
                <tr>
                  <th>
                    <!-- New Person -->
                    <button
                      type="button"
                      class="btn btn-outline-info btn-sm ms-3"
                      @click="onClickNewPerson()"
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
                      @click.stop="onClickDeletePerson(task.id)"
                    >
                      <i class="bi bi-x"></i>
                    </button>

                    <!-- módosítás -->
                    <button
                      type="button"
                      class="btn btn-outline-success btn-sm ms-2"
                      @click.stop="onClickEditPerson(task.id)"
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

    <!-- DELETE MODAL -->

    <div
      class="modal fade"
      id="deleteModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content my-modal">
          <div class="modal-header">
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">Biztosan törölni akarja?</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Mégse
            </button>

            <button
              type="button"
              class="btn btn-primary"
              @click="onClickDeleteModal()"
            >
              Igen
            </button>
          </div>
        </div>
      </div>
    </div>

    <!--#region Modal for Films -->
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
              {{ this.stateTitle }}
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
                  type="number"
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
                  type="number"
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

    <!--#region Modal for Persons -->
    <!-- MODAL PERSONS-->
    <div
      class="modal fade"
      id="personModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header my-modal">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              {{ statePersonsTitle }}
            </h1>
            <button
              type="button"
              class="btn-close"
              @click="onClickCancelPerson()"
              aria-label="Close"
            ></button>
          </div>

          <!--#region Modal body -->
          <div class="modal-body my-modal">
            <!--#region Form -->

            <!-- PERSON DROPDOWN -->
            <form class="row g-3 needs-validation" novalidate>
              <select
                class="form-select"
                aria-label="Default select example"
                v-model="editablePerson.personid"
              >
                <option
                  v-for="(person, index) in personsABC"
                  :key="`person${index}`"
                  :value="person.id"
                >
                  {{ person.name }}
                </option>
              </select>

              <div class="col-md-12">
                <label for="name" class="form-label">Besorolása</label>
                <input
                  type="text"
                  class="form-control"
                  id="denomination"
                  required
                  v-model="editablePerson.denomination"
                />
                <div class="invalid-feedback">
                  A besorolás kitöltése kötelező
                </div>
              </div>
            </form>
            <!--#endregion Form -->
          </div>
          <!--#endregion Modal body -->

          <div class="modal-footer my-modal">
            <button
              type="button"
              class="btn btn-secondary"
              @click="onClickCancelPerson()"
            >
              Mégse
            </button>
            <button
              type="button"
              class="btn btn-primary"
              @click="onClickSavePerson()"
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
import { defaultModifiers } from "@popperjs/core/lib/popper-lite";
import LoginViewVue from "./LoginView.vue";
const storeCounter = useCounterStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class FilmT {
  constructor(
    id = 0,
    title = null,
    production = null,
    lengthh = null,
    presentation = null,
    youtube = null,
    links = null,
    embedding = null,
    tasks = []
  ) {
    this.id = id;
    this.title = title;
    this.production = production;
    this.lengthh = lengthh;
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
    lengthh = null,
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
    this.lengthh = lengthh;
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
class PersonTask {
  constructor(filmid = null, personid = null, denomination = null) {
    this.filmid = filmid;
    this.personid = personid;
    this.denomination = denomination;
  }
}
class Task {
  constructor(name = null, denomination = null) {
    this.name = name;
    this.denomination = denomination;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      films: [],
      persons: [],
      editableFilms: new FilmT(),
      editablePerson: new PersonTask(),
      form: null,
      state: "view",
      currentId: null,
      currentDataId: null,
      filmPerson: new filmPerson(),
      keresoszo: null,
      urlFilmFilter: "http://localhost:3000/getFilmFilter",
      personsABC: [],
    };
  },
  mounted() {
    this.getFilms();
    this.getPersons();
    // this.getFreeDriversAbc();
    this.modal = new bootstrap.Modal(document.getElementById("filmModal"), {
      keyboard: false,
    });
    this.modalPerson = new bootstrap.Modal(
      document.getElementById("personModal"),
      {
        keyboard: false,
      }
    );
    this.modalDelete = new bootstrap.Modal(
      document.getElementById("deleteModal"),
      {
        keyboard: false,
      }
    );

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
    async getPersons() {
      let url = this.storeUrl.urlPersons;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.persons = data.data;
    },
    async getPersonsABC() {
      let url = this.storeUrl.urlPersonsABC;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.personsABC = data.data;
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
    async getPersonById(id) {
      let url = `${this.storeUrl.urlPersons}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editablePerson = data.data;
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

    async getFilmFilter() {
      const urlFilm = `${this.urlFilmFilter}/${this.keresoszo}`;
      const response = await fetch(urlFilm);
      const data = await response.json();
      this.films = data.data;
    },

    onClickSearchButton() {
      if (this.keresoszo.trim()) {
        this.getFilmFilter();
      } else {
        this.getFilms();
      }
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
    async postPerson() {
      let url = this.storeUrl.urlTasks;
      const body = JSON.stringify(this.editablePerson);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      const data = await response.json();
      console.log("post", data);
      this.getPersonById(this.currentId);
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
    async putPerson() {
      const id = this.editablePerson.id;
      let url = `${this.storeUrl.urlPersons}/${id}`;
      const body = JSON.stringify(this.editablePerson);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getPersons();
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
    async deletePerson(id) {
      let url = `${this.storeUrl.urlPersons}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getPersons();
    },
    // onClikRow(id) {
    //   this.currentId = id;
    // },
    onClickNew(id) {
      this.state = "new";
      this.currentId = null;
      this.editableFilms = new FilmT();
      this.modal.show();
    },
    onClickNewPerson() {
      console.log("New");
      this.state = "new";
      this.getPersonsABC();
      this.editablePerson = new PersonTask();
      console.log(this.currentId);
      this.editablePerson.filmid = this.currentId;
      this.modalPerson.show();
    },
    onClickDelete(id) {
      if ((this.state = "delete")) {
        this.modalDelete.show();
        this.currentId = null;
      } else if (this.modalDelete.show()) {
        this.onClickDeleteModal(this.currentId);
      }
    },
    onClickDeleteModal(currentId) {
      this.state = "delete";
      this.deleteFilm(this.currentId);
      this.currentId = null;
      this.modalDelete.hide();
    },
    onClickDeletePerson(id) {
      this.state = "delete";
      this.currentId = null;
      this.deletePerson(this.currentId);
    },

    // onClickPersonDeleteModal(currentId){
    //   this.state = "delete";
    //   this.deletePerson(this.currentId);
    //   this.currentId = null;
    //   this.modalDelete.hide();

    // },
    onClickEdit(id) {
      this.state = "edit";
      this.getFilmById(id);
      this.modal.show();
    },
    onClickEditPerson(id) {
      this.state = "edit";
      this.getPersonById(id);
      this.modalPerson.show();
    },

    onClickCancel() {
      this.editableFilms = new FilmT();
      this.modal.hide();
    },
    onClickCancelPerson() {
      this.editablePerson = new PersonTask();
      this.modalPerson.hide();
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
   onClickSavePerson() {
      if (this.state == "new") {
        //post
        this.postPerson();
        this.modalPerson.hide();
      }

      // console.log("SAVE");
      // this.form.classList.add("was-validated");
      // if (this.form.checkValidity()) {
      //   if (this.state == "edit") {
      //     //put
      //     this.putPerson();
      //     this.modalPerson.hide();
      //   } else if (this.state == "new") {
      //     //post
      //     this.postPerson();
      //     this.modalPerson.hide();
      //   }
      //   this.modalPerson.hide();
      //   //frissíti a taxisok listáját
      //   this.getPersons();
      // }
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
    statePersonsTitle() {
      if (this.state === "new" && this.modalPerson.show()) {
        return "Új személy hozzáadása";
      } else if (this.state === "edit") {
        return "Személy módosítása";
      }
    },
  },
};
</script>


<style>
.my-bg-current-row {
  background-color: rgba(182, 5, 14, 0.2);
}
.my-table {
  background: #222;
  border: 2px ridge red;
  color: white;
}
h2 {
  color: red;
}
.my-scroll {
  overflow-y: scroll;
  height: 90vh;
  width: 450px !important;

  border: 2px ridge red;
}
.table-hover {
  color: white !important;
}
</style>
