import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import Navigation from "../components/navigation.vue";

Vue.use(TurbolinksAdapter);
Vue.component('navigation', Navigation);

document.addEventListener("turbolinks:load", () => {
  const app = new Vue({
    el: "#nav",
  });
});
