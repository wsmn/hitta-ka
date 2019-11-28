<template>
  <div>
    <button @click="open" :class="className">
      {{ text }}
      Meddelande
    </button>
    <modal :name="name" @close="close" v-if="showModal"> </modal>
  </div>
</template>

<script>
export default {
  name: "modal-button",
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
