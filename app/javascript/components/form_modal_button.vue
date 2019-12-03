<template>
  <div>
    <button @click="open" :class="className">
      {{ text }}
      Förfrågan
    </button>
    <form_modal :name="name" @close="close" v-if="showModal"> </form_modal>
  </div>
</template>

<script>
export default {
  name: "form-modal-button",
  props: ["name", "className", "text"],
  methods: {
    open() {
      this.showModal = true;
    },
    close() {
      this.showModal = false;
    }
  },
  data() {
    return {
      showModal: false
    };
  }
};
</script>
