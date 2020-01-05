import "styles/application";

import CompanyList from "../components/company_list.vue";
import CompanyMap from "../components/company_map.vue";
import CompanyInfo from "../components/company_info.vue";
import CompanyPopup from "../components/company_popup.vue";
import EnquiryList from "../components/enquiry_list.vue";
import Mapbox from "../components/mapbox.vue";
import Modal from "../components/modal.vue";
import MessageModal from "../components/message_modal.vue";
import FormModal from "../components/form_modal.vue";
import Flash from "../components/flash.vue";
import Navigation from "../components/navigation.vue";
import Questionnaire from "../components/questionnaire.vue";
import LoadingProgress from "../components/loading_progress.vue";
import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import axios from "axios";

Vue.use(TurbolinksAdapter);
Vue.prototype.$http = axios;
Vue.component("company-list", CompanyList);
Vue.component("company-map", CompanyMap);
Vue.component("company-info", CompanyInfo);
Vue.component("company-popup", CompanyInfo);
Vue.component("enquiry-list", EnquiryList);
Vue.component("form-modal", FormModal);
Vue.component("flash", Flash);
Vue.component("loading-progress", LoadingProgress);
Vue.component("mapbox", Mapbox);
Vue.component("message-modal", MessageModal);
Vue.component("modal", Modal);
Vue.component("navigation", Navigation);
Vue.component("questionnaire", Questionnaire);

document.addEventListener("turbolinks:load", () => {
  let elements = document.querySelectorAll('[data-behaviour="vue"');
  for (let el of elements) {
    new Vue({
      el: el,
    });
  }
});
