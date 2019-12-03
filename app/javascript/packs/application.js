import "styles/application";
import "../forms";
import "../notifications";
import "../shortcuts";

import CompanyList from "../components/company_list.vue";
import CompanyMap from "../components/company_map.vue";
import CompanySidebar from "../components/company_sidebar.vue";
import Mapbox from "../components/mapbox.vue";
import Modal from "../components/modal.vue";
import ModalButton from "../components/modal_button.vue";
import FormModal from "../components/form_modal.vue";
import FormModalButton from "../components/form_modal_button.vue";
import Navigation from "../components/navigation.vue";
import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import axios from "axios";

Vue.use(TurbolinksAdapter);
Vue.prototype.$http = axios;
Vue.component("company-list", CompanyList);
Vue.component("company-map", CompanyMap);
Vue.component("company-sidebar", CompanySidebar);
Vue.component("mapbox", Mapbox);
Vue.component("modal", Modal);
Vue.component("modal-button", ModalButton);
Vue.component("form_modal", FormModal);
Vue.component("form-modal-button", FormModalButton);
Vue.component("navigation", Navigation);

document.addEventListener("turbolinks:load", () => {
  let elements = document.querySelectorAll('[data-behaviour="vue"');
  for (let el of elements) {
    new Vue({
      el: el,
    });
  }
});
