import "styles/application";
import "alpinejs";

import axios from "axios";
import Vue from "vue/dist/vue.esm";
import PortalVue  from "portal-vue";
import TurbolinksAdapter from "vue-turbolinks";

import CompanyInfo from "../components/company_info.vue";
import CompanyList from "../components/company_list.vue";
import CompanyMap from "../components/company_map.vue";
import CompanyPopup from "../components/company_popup.vue";
import EnquiryList from "../components/enquiry_list.vue";
import FormModal from "../components/form_modal.vue";
import LoadingProgress from "../components/loading_progress.vue";
import Mapbox from "../components/mapbox.vue";
import MessageModal from "../components/message_modal.vue";
import Modal from "../components/modal.vue";
import Questionnaire from "../components/questionnaire.vue";

Vue.prototype.$http = axios;
Vue.use(TurbolinksAdapter);
Vue.use(PortalVue);

Vue.component("company-info", CompanyInfo);
Vue.component("company-list", CompanyList);
Vue.component("company-map", CompanyMap);
Vue.component("company-popup", CompanyPopup);
Vue.component("enquiry-list", EnquiryList);
Vue.component("form-modal", FormModal);
Vue.component("loading-progress", LoadingProgress);
Vue.component("mapbox", Mapbox);
Vue.component("message-modal", MessageModal);
Vue.component("modal", Modal);
Vue.component("questionnaire", Questionnaire);

document.addEventListener("turbolinks:load", () => {
  let elements = document.querySelectorAll('[data-behaviour="vue"');
  for (let el of elements) {
    new Vue({
      el: el,
    });
  }
});
