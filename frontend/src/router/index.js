
import { createRouter, createWebHistory } from "vue-router";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: () => import("../views/HomeView.vue"),
      meta: {
        requiresAuth: false,
        title: "Főoldal / Filmek",
      },
    },
    {
      path: "/about",
      name: "about",
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import("../views/AboutView.vue"),
      meta: {
        requiresAuth: false,
        title: "About / Filmek",
      },
    },
    {
      path: "/movies",
      name: "movies",
      component: () => import("../views/Movies.vue"),
      meta: {
        requiresAuth: false,
        title: "Random film / Filmek",
      },
    },
    {
      path: "/movieSettings",
      name: "movieSettings",
      component: () => import("../views/MovieSettings.vue"),
      meta: {
        requiresAuth: true,
        title: "Film szerkeztése / Filmek",
      },
    },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      meta: {
        requiresAuth: false,
        title: "Belépés / Filmek",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      name: "PageNotFound",
      component: () => import("../views/404View.vue"),
      meta: {
        requiresAuth: false,
        title: "404 / Filmek",
      },
    },
  ],
});

export default router;
