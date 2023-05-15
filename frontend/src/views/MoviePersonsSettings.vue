<template>
  <div>
    <div class="row">
      <div class="col-6">
        <h1 class="m-3 my-font d-flex">Közreműködők szerkeztése</h1>
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

    <center>
      <h2 class="ms-3 my-font">Közreműködők</h2>
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
          <tr v-for="(person, index) in persons" :key="`task${index}`">
            <td class="text-nowrap">
              <!-- törlés -->
              <button
                type="button"
                class="btn btn-outline-danger btn-sm"
                @click.stop="onClickDeletePerson(person.id)"
              >
                <i class="bi bi-x"></i>
              </button>

              <!-- módosítás -->
              <button
                type="button"
                class="btn btn-outline-success btn-sm ms-2"
                @click.stop="onClickEditPerson(person.id)"
              >
                <i class="bi bi-pencil-fill"></i>
              </button>
            </td>

            <td class="text-nowrap">{{ person.name }}</td>
            <td>{{ person.denomination }}</td>
          </tr>
        </tbody>
      </table>
    </center>

<!-- MODAL PERSON -->
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
             Személyek szerkeztése
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
                <div class="col-md-12">
                <label for="name" class="form-label">Neve</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  required
                  v-model="editablePerson.name"
                />
                <div class="invalid-feedback">
                  A név kitöltése kötelező
                </div>
              </div>


              <div class="col-md-12">
                <label for="name" class="form-label">Besorolása</label>
                <select
                class="form-select"
                aria-label="Default select example"
                v-model="editablePerson.personid"
              >
                <option
                  v-for="(person, index) in persons"
                  :key="`person${index}`"
                >
                  {{ person.denomination}}
                </option>
              </select>


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

class Person {
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
      persons: [],
      editablePerson: new Person(),
      form: null,
      state: "view",
      currentId: null,
      currentDataId: null,
      keresoszo: null,
      urlPersonFilter: "http://localhost:3000/getPersonFilter",
      personsABC: [],
    };
  },

  mounted() {
    this.getPersons();
    // this.getFreeDriversAbc();
    this.modalPerson = new bootstrap.Modal(
      document.getElementById("personModal"),
      {
        keyboard: false,
      }
    );
    // this.modalDelete = new bootstrap.Modal(
    //   document.getElementById("deleteModal"),
    //   {
    //     keyboard: false,
    //   }
    // );

    this.form = document.querySelector(".needs-validation");
  },
  methods: {

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

    async getPersonFilter() {
      const urlPersons = `${this.urlPersonFilter}/${this.keresoszo}`;
      const response = await fetch(urlPersons);
      const data = await response.json();
      this.persons = data.data;
    },

    onClickSearchButton() {
      if (this.keresoszo.trim()) {
        this.getPersonFilter();
      } else {
        this.getPersons();
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

    async postPerson() {
      let url = this.storeUrl.urlPersons;
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

    onClickNewPerson() {
      this.state = "new";
      this.getPersons();
      this.editablePerson = new Person();
      this.modalPerson.show();
    },

    onClickDeletePerson(id) {
      this.state = "delete";
      this.currentId = null;
      this.deletePerson(this.currentId);
    },


    onClickEditPerson(id) {
      this.state = "edit";
      this.getPersonById(id);
      this.modalPerson.show();
    },
    onClickCancelPerson() {
      this.editablePerson = new Person();
      this.modalPerson.hide();
    },


     onClickSavePerson() {
      if (this.state == "new") {
        //post
        this.postPerson();
        this.modalPerson.hide();
      }

    },


  },
};
</script>

<style>
.my-search {
  float: right;
}
</style>