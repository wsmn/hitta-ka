
import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
    const app = new Vue({
        el: '#nav',
        data: function () {
        return {
            isOpen: true,
        }
        },
        methods: {
        open() {
            this.isOpen = true
            this.$nextTick(() => {
            this.$refs.closeButton.focus()
            })
        },
        close() {
            this.isOpen = false
            this.$nextTick(() => {
            this.$refs.openButton.focus()
            })
        }
        },
        watch: {
        isOpen: {
            immediate: true,
            handler(isOpen) {
            if (isOpen) {
                document.body.style.setProperty('overflow', 'hidden')
            } else {
                document.body.style.removeProperty('overflow')
            }
            }
        }
        }
    });
});
