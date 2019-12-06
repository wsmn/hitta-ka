<template>
  <transition name="modal">
    <div class="modal-mask" @click="close">
      <div class="modal-wrapper">
        <div class="modal-body flex flex-wrap md:items-center">
          <div class="w-full mx-auto p-4 lg:p-0">
            <div
              class="w-full lg:w-1/2 xl:w-1/3 mx-auto bg-white shadow-xl rounded-lg mt-8 max-w-2xl"
            >
              <div class="w-full flex border-b border-gray-400 p-5 items-center">
                <div class="w-3/4 md:w-4/5 lg:w-5/6">
                  <p class="font-bold text-base lg:text-lg text-gray-800">
                    Skicka meddelande till
                  </p>
                  <p class="font-bold leading-tight text-base lg:text-base text-blue-500">
                    Cömpany AB
                  </p>
                </div>
                <div class="w-1/4 md:w-1/5 lg:w-1/6 flex items-center">
                  <img v-bind:src="require('images/message_map.svg')" />
                </div>
              </div>
              <div class="p-5 flex flex-col">
                <div class="flex flex-wrap mb-6 items-center">
                  <div class="hidden lg:w-1/3 lg:block">
                    <div class="pr-2">
                      <h2 class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0">Namn</h2>
                    </div>
                  </div>
                  <div class="w-full lg:w-2/3 flex flex-wrap">
                    <div class="w-1/2 pr-2">
                      <h2 class="tracking-wide leading-none text-gray-700 text-sm font-semibold mb-1">
                        Förnamn
                      </h2>
                      <input
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      id="grid-email-adress"
                      type="text"
                      />
                    </div>
                    <div class="w-1/2 pl-2">
                      <h2 class="tracking-wide leading-none text-gray-700 text-sm font-semibold mb-1">
                        Efternamn
                      </h2>
                      <input
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      id="grid-email-adress"
                      type="text"
                      />
                    </div>
                  </div>
                </div>
                <div class="flex flex-wrap mb-6 items-center">
                  <div class="w-full lg:w-1/3">
                    <div class="pr-2">
                      <h2 class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0">Telefonnummer</h2>
                    </div>
                  </div>
                  <div class="w-full lg:w-2/3">
                    <div class="w-full">
                      <input
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      id="grid-email-adress"
                      type="text"
                    />
                    </div>
                  </div>
                </div>
                <div class="flex flex-wrap mb-6 items-center">
                  <div class="w-full lg:w-1/3">
                    <div class="pr-2">
                      <h2 class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0">Email</h2>
                    </div>
                  </div>
                  <div class="w-full lg:w-2/3">
                    <div class="w-full">
                      <input
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      id="grid-email-adress"
                      type="text"
                    />
                    </div>
                  </div>
                </div>
                <div class="flex flex-wrap mb-6 items-center">
                  <div class="w-full lg:w-1/3">
                    <div class="pr-2">
                      <h2 class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0">Ämne</h2>
                    </div>
                  </div>
                  <div class="w-full lg:w-2/3">
                    <div class="w-full">
                      <input
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      id="grid-email-adress"
                      type="text"
                    />
                    </div>
                  </div>
                </div>
                <div class="flex flex-wrap">
                  <div class="w-full lg:w-1/3">
                    <div class="pr-1">
                      <h2 class="text-sm lg:text-base text-gray-700 font-semibold">Meddelande</h2>
                      <p class="text-xs lg:text-sm font-semibold lg:mt-1 text-gray-500 mb-1 lg:mb-0">Här skriver du ditt meddelande till företaget .Max 1000 ord.</p>
                    </div>
                  </div>
                  <div class="w-full lg:w-2/3">
                    <div class="w-full">
                      <textarea
                      class="appearance-none resize-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 h-24"
                      id="subject"
                      type="description">
                      </textarea>
                    </div>
                  </div>
                </div>
              </div>
              <div class="w-full flex border-t border-gray-300 py-5 px-5">
                <div class="w-full flex justify-end items-center">
                  <div class="w-20 mr-3">
                    <button
                      @click="close"
                      class="w-full text-blue-600 uppercase font-bold text-xs hover:text-blue-300"
                    >
                      Cancel
                    </button>
                  </div>
                  <div class="w-16">
                    <button
                      class="py-2 px-2 w-full uppercase shadow-md no-underline rounded bg-blue-600 text-white font-bold text-xs hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
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
