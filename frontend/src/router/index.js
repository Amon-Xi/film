import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView,
      meta: {
        requiresAuth: false,
        title: "Home / Movies",
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
        title: "About / Movies",
      },
    },
    {
      path: "/movies",
      name: "movies",
      component: () => import("../views/Movies.vue"),
      meta: {
        requiresAuth: false,
        title: "Movie searcher / Movies",
      },
    },
    {
      path: "/movieSettings",
      name: "movieSettings",
      component: () => import("../views/MovieSettings.vue"),
      meta: {
        requiresAuth: true,
        title: "Movie settings / Movies",
      },
    },
    {
      path: "/fuvarBevitel",
      name: "fuvarBevitel",
      component: () => import("../views/FuvarBevitel.vue"),
      meta: {
        requiresAuth: true,
        title: "Fuvar bevitel / Movies",
      },
    },  
    {
      path: "/login",
      name: "login",
      component: () => import("../views/LoginView.vue"),
      meta: {
        requiresAuth: false,
        title: "Login / Movies",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      name: "PageNotFound",
      component: () => import("../views/404View.vue"),
      meta: {
        requiresAuth: false,
        title: "404 / Movies",
      },
    },
  ],
});

export default router;
