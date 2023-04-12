<template>
  <div id="carouselExample" class="carousel slide position-relative" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src= "/frontend/kepek/oigen.jpg" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="/frontend/kepek/among-us-sus.gif" class="d-block w-100" alt="..."  />
      </div>
      <div class="carousel-item">
        <img src="/frontend/kepek/myreaction.jpg" class="d-block w-100" alt="..." />
      </div>
    </div>
    <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselExample"
      data-bs-slide="prev"
    >
      <div class="carousel-control-prev-icon" aria-hidden="true"></div>
      <div class="visually-hidden">Previous</div>
    </button>
    <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselExample"
      data-bs-slide="next"
    >
      <div class="carousel-control-next-icon" aria-hidden="true"></div>
      <div class="visually-hidden">Next</div>
    </button>

    <div class="position-absolute top-50 start-50 translate-middle">
      <h1 class="my-fs-cim"><div class="p-2 ps-4 pe-4 my-bg-cim">Movies</div> </h1>
    </div>

  </div>
</template>

<script>
export default {};
</script>s
<style>
.my-bg-cim {
  background-color: rgba(255,255,255,0.3);
  border-radius: 10px;
}
.my-fs-cim {
  font-size: 5rem;
  font-weight: normal;
}

</style>