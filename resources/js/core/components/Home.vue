<template>
  <div>
      <div class="main-section shadow">
        <a href="#" class="main-photo">
          <img src="assets/img/home-page/main-photo.jpg">
          <div class="content-item">
            <div class="main-title">
              <h2>«Авиценна-Медикал»
                <br/>
                Многопрофильная клиника</h2>
            </div>
            <div class="more-item">
              <router-link :to="{name: 'about'}" class="btn btn-rounded btn-amber bg-primary text-white">Подробнее
              </router-link>
            </div>
          </div>
        </a>
      </div>
  </div>
</template>

<script>

</script>

<style scoped>
.container-fluid{
  padding: 0;
}
.main-section{
  height: 500px;
  position: relative;
  /*width: 100%;*/
}
.main-photo img{
  width: 100%;
  /*position: absolute;*/
  left: 0;
  right: 0;
}
.content-item{
  -webkit-box-pack: justify;
  justify-content: space-between;
  padding: 40px 0 80px 80px;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  flex-direction: column;
  width: 100%;
  margin: 0 auto;
  max-width: 1360px;
  position: absolute;
  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
}
.main-title{
  font-weight:700;
  font-size: 44px;
}
</style>

