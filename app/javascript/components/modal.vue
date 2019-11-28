<template>
  <transition name="modal">
    <div class="modal-mask" @click="close">
      <div class="modal-wrapper">
        <div class="modal-body flex flex-wrap md:items-center">
          <div class="w-full mx-auto p-4 lg:p-0">
            <div
              class="w-full lg:w-1/2 xl:w-1/3 mx-auto bg-white shadow-xl rounded mt-8 max-w-xl"
            >
              <div
                class="w-full flex border-b border-gray-400 py-4 px-8 items-center"
              >
                <div class="w-3/4">
                  <p class="font-bold text-2xl text-gray-800">
                    Send message to
                  </p>
                  <p class="font-bold text-2xl text-blue-500">
                    Cömpany AB
                  </p>
                </div>
                <div class="w-1/4 flex items-center">
                  <img v-bind:src="require('images/message_map.svg')" />
                </div>
              </div>
              <div class="px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                <div class="-mx-3 md:flex mb-6">
                  <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                    <label
                      class="tracking-wide text-gray-800 text-base font-bold"
                    >
                      First Name
                    </label>
                    <input
                      class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                      id="grid-first-name"
                      type="text"
                    />
                  </div>
                  <div class="w-full md:w-1/2 px-3">
                    <label
                      class="tracking-wide text-gray-800 text-base font-bold"
                    >
                      Last Name
                    </label>
                    <input
                      class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                      id="grid-last-name"
                      type="text"
                    />
                  </div>
                </div>
                <div class="-mx-3 md:flex mb-6">
                  <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                    <label
                      class="tracking-wide text-gray-800 text-base font-bold"
                    >
                      Email
                    </label>
                    <input
                      class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                      id="grid-email-adress"
                      type="text"
                    />
                  </div>
                  <div class="w-full md:w-1/2 px-3">
                    <label
                      class="tracking-wide text-gray-800 text-base font-bold"
                    >
                      Phone
                      <p class="font-normal text-gray-600 inline">(optional)</p>
                    </label>
                    <input
                      class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                      id="grid-phone-number"
                      type="text"
                    />
                  </div>
                </div>
                <div class="flex flex-wrap -mx-3">
                  <div class="w-full px-3">
                    <label
                      class="tracking-wide text-gray-900 text-base font-bold"
                    >
                      Message
                      <p class="font-normal text-gray-600 inline">
                        (Max 1000 words)
                      </p>
                    </label>
                    <textarea
                      class="appearance-none mt-2 block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 h-32"
                      id="subject"
                      type="description"
                    ></textarea>
                  </div>
                </div>
                <div class="w-full flex justify-end mt-6">
                  <div class="w-1/4 mr-4">
                    <button
                      @click="close"
                      class="py-2 w-full shadow-md no-underline rounded bg-red-300 text-red-600 font-bold text-sm hover:text-white hover:bg-red-400 focus:outline-none active:shadow-none"
                    >
                      Cancel
                    </button>
                  </div>
                  <div class="w-1/4">
                    <button
                      class="py-2 w-full shadow-md no-underline rounded bg-green-500 text-white font-bold text-sm hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
                    >
                      Send
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "modal",
  data() {
    return {
      showModal: false,
      company: "Cömpany"
    };
  },
  methods: {
    close() {
        this.$emit("close");
    }
  }
};
</script>

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-body {
  height: 100%;
  overflow-y: auto;
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
