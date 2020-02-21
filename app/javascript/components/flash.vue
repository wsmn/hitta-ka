<template>
  <transition name="flash">
    <div
      v-if="show"
      class="rounded relative border px-4 py-3 mt-2 "
      :class="divClasses"
      role="alert"
    >
      <i class="fas fa-check text-green-500 mr-1"></i>
      <span class="inline">{{ text }}</span>
      <span class="absolute top-0 bottom-0 right-0 px-4 py-3">
        <svg
          @click="close"
          role="button"
          class="fill-current h-6 w-6 cursor-pointer"
          :class="closeClasses"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
        >
          <title>Close</title>
          <path
            d="M14.348 14.849a1.2 1.2 0 0 1-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 1 1-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 1 1 1.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 1 1 1.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 0 1 0 1.698z"
          />
        </svg>
      </span>
    </div>
  </transition>
</template>

<script>
export default {
  name: "flash",
  props: ["text", "type"],
  data: () => ({
    show: true
  }),
  computed: {
    divClasses: function() {
      return {
        "bg-red-100 border-red-400 text-red-700": this.type == 'alert',
        "bg-blue-100 border-blue-400 text-blue-700": this.type == 'notice',
      }
    },
    closeClasses: function() {
      return {
        "text-red-500": this.type == 'alert',
        "text-blue-500": this.type == 'notice',
      }
    }
  },
  methods: {
    close: function() {
      this.show = false;
    }
  }
};
</script>
