<template>

 
  <div id="carouselExample" class="carousel slide position-relative" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../../images/oldmovie1.png" class="d-block w-100"  alt="">
      </div>
      <div class="carousel-item">
        <img src="../../images/oldmovie2.png" class="d-block w-100" alt="..."  />
      </div>
      <div class="carousel-item">
        <img src="../../images/oldmovie3.png" class="d-block w-100" alt="..." />
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
      <h1 class="my-fs-cim"><div class="p-2 ps-4 pe-4 my-bg-cim">Régi magyar filmek</div> </h1>
    </div>

  </div>
</template>

<script>
export default {};
</script>s
<style>
.my-bg-cim {
  background-color: rgba(255,255,255,0.1);
}
.my-fs-cim {
  font-size: 5rem;
  font-weight: normal;
  text-shadow: 2px 4px 4px rgba(46,91,173,0.6);
  font-family: 'Times New Roman', Times, serif;
}

</style>