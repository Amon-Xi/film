<template>
  <div>
    <div class="p-3 d-flex col-4">
      <input
        class="form-control me-2"
        type="search"
        placeholder="Keress egy filmre..."
        aria-label="Search"
      />
      <button class="btn btn-outline-danger d-flex" type="submit">
        Keresés
      </button>
    </div>

    <!-- CARD -->
    <div class="card" style="width: 18rem">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
        <p class="card-text">
          Some quick example text to build on the card title and make up the
          bulk of the card's content.
        </p>
        <!-- Button trigger modal -->
        <button
          type="button"
          class="btn btn-primary"
          data-bs-toggle="modal"
          data-bs-target="#moviesModal"
        >
          <i class="bi bi-arrow-90deg-right"></i>
        </button>
      </div>
    </div>

      <!-- Modal -->
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
            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">...</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();

export default {
  data() {
    return {
      // storeUrl,
      // storeLogin,
      // films: [],
    };
  },
  mounted() {
    // // this.getMovies();
    // this.modal = new bootstrap.Modal(document.getElementById("moviesModal"), {
    //   keyboard: false,
    // });
    // this.form = document.querySelector(".needs-validation");
  },
  methods: {
    // async getMovies() {
    //   let url = this.storeUrl.urlFilms;
    //   console.log(url);
    //   const config = {
    //     method: "GET",
    //     headers: {
    //       Authorization: `Bearer ${this.storeLogin.accessToken}`,
    //     },

    //   };
    //   const response = await fetch(url, config);
    //   const data = await response.json();
    //   this.films = data.data;
    // ModalClick() {
    //   this.modal.show();
    // },
  },
};
// };
</script>

<style>
.modal-backdrop {
  display: none;
}
</style>
