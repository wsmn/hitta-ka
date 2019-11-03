import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Modal from '../components/modal.vue'


Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    if(document.getElementById('modal') !== null) {
        Vue.component('step-item', {
         template: '#modal-template'
        })
        const modal = new Vue({
            el: '#modal',
            components: { Modal },
            data: { showModal: false }
        });
    };
});
