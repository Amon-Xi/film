<template>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark my-navbar">
    <div class="container-fluid">
      <div class="my-homepic  ">

        <router-link class="navbar-brand my-hometext " to="/"
        @click="onClickMenu(1)"
        >  <span class="bi bi-house "></span>  </router-link>
        <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
        >
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
      <div class="collapse navbar-collapse my-navbar" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <!-- <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/"
            :class="{active: menuState === 2}"
            @click="onClickMenu(2)"
              >Főoldal</router-link
            >
          </li> -->
          <li class="nav-item">
            <router-link class="nav-link" to="/about"
            :class="{active: menuState === 3}"
            @click="onClickMenu(3)"
            >Rólunk</router-link>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              :class="{active: menuState === 4}"
              @click="onClickMenu(4)"
            >
              Egyebek
            </a>
            <ul class="dropdown-menu">
              <li>
                <router-link id="movieEdit" class="dropdown-item" to="/movieSettings"
                  :class="{ disabled: !storeLogin.loginSuccess }"
                  > Filmek Szerkeztése</router-link>
                
              </li>
              <li><hr class="dropdown-divider" /></li>
              <li>
                <router-link id="movieEdit" class="dropdown-item" to="/movieSettings"
                  :class="{ disabled: !storeLogin.loginSuccess }"
                  > Személyek Szerkeztése</router-link>
                
              </li>

            </ul>
          </li>
          <li class="nav-item" v-if="!storeLogin.loginSuccess">
            <router-link class="nav-link" to="/login">Belépés  </router-link>
          </li>
          <li class="nav-item" v-if="storeLogin.loginSuccess" @click="logout()">
            <router-link class="nav-link" to="/login"
            >Kilépés ({{ storeLogin.userName }})</router-link
            >
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

const msg = "helo";
let menuState = null;
async function logout() {
  console.log("logout");
  const urlLogout = storeUrl.urlLogout;
  const body = {
    token: storeLogin.refreshToken,
  };
  const config = {
    method: "DELETE",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  };
  const response = await fetch(urlLogout, config);
  storeLogin.clearLogin();
}
function onClickMenu(number){
  this.menuState = number
}
// export default {
//   data() {
//     return {
//       storeUrl,
//       storeLogin
//     }
//   }
// };}
// export default {
//   data() {
//     return {
//       storeUrl,
//       storeLogin
//     }
//   }
// };



</script>

<style>
.router-link-active {
  color: rgb(224, 64, 64) !important
}

.my-hometext{
  text-shadow: 2px 4px 4px rgba(0, 89, 255, 0.6);

}

.my-homepic{
  text-align: center ;
  
}



/* .navbar-nav > li > .dropdown-menu a:link,
.navbar-nav > li > .dropdown-menu a:hover { background-color: black} */
</style>