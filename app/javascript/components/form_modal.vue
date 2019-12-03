<template>
    <transition name="form_modal">
        <div class="modal-mask" @click="close">
            <div class="modal-wrapper">
                <div class="modal-body flex flex-wrap lg:items-center">
                    <div class="w-full flex flex-wrap p-4 lg:p-0">
                        <div class="w-full md:w-2/3 lg:w-5/6 xl:w-2/3 flex flex-wrap mx-auto bg-gray-300 rounded-lg border border-gray-400">
                            <div class="w-full lg:w-2/3 xl:w-2/3 p-4 xl:p-8">
                                <div class="lg:px-4 flex flex-col">
                                    <div class="-mx-3 md:flex">
                                        <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                                            <label class="tracking-wide text-gray-800 text-base font-bold">
                                                Projektstart
                                            </label>
                                            <input class="appearance-none block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2" id="grid-first-name" type="text">
                                        </div>
                                        <div class="w-full md:w-1/2 px-3">
                                            <label class="tracking-wide text-gray-800 text-base font-bold">
                                                Välj projekttyp:
                                            </label>
                                            <div class="relative">
                                                <select class="block appearance-none w-full bg-white border border-gray-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white mt-2">
                                                <option selected="selected"></option>
                                                <option>Nybyggnation</option>
                                                <option>Tillbyggnad</option>
                                                <option>Renovering</option>
                                                <option>Annat</option>
                                                </select>
                                                <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-full lg:px-4">
                                    <label class="tracking-wide text-gray-900 text-base font-bold">
                                        Beskriv projektet <p class="font-normal text-gray-700 inline">(Tips!)</p>
                                    </label>
                                    <textarea class="appearance-none mt-2 block w-full bg-white text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 h-32" id="subject" type="description"></textarea>
                                </div>
                                <div class="mt-4 mb-4 lg:px-4">
                                    <label class="tracking-wide text-blue-600 text-base font-bold">
                                        Välj hustyp:
                                    </label>
                                    <div class="flex flex-wrap mt-4 -mx-2 lg:-mx-4">
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-home font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Hus</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-city font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Lägenhet</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-hotel font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Radhus</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-campground font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Fritidshus</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="flex flex-wrap mt-6 -mx-2 lg:-mx-4">
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-industry font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Industri</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-building font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Kontor</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                    <i class="fas fa-utensils font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs text-center lg:text-base">Restaurang</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="w-1/4 mx-auto px-2 lg:px-4">
                                            <div class="text-gray-700 text-center bg-white rounded shadow-md hover:shadow-xl p-2 lg:p-6">
                                                <div class="items-center justify-center mx-auto font-semibold">
                                                        <icon v-bind:src="require('images/message_map.svg')" />
                                                    <i class="fas fa-question-circle font-bold text-blue-500 text-2xl lg:text-3xl"></i>
                                                    <h3 class="mt-0 lg:mt-2 text-xs lg:text-base">Annat</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="w-full lg:w-1/3 xl:w-1/3 bg-gray-100 p-6 xl:p-8 flex flex-col lg:border-l border-gray-400 rounded-b-lg lg:rounded-bl-none lg:rounded-r-lg">
                                <div class="w-full flex items-center">
                                    <div class="border-2 border-blue-500 rounded-full h-10 w-10 lg:h-12 lg:w-12 flex items-center justify-center text-blue-500 text-base lg:text-xl font-bold">
                                        1
                                    </div>
                                    <p class="text-blue-500 font-bold ml-4">Describe your project</p>
                                </div>
                                <div class="w-full flex items-center mt-4">
                                    <div class="border-2 border-gray-500 rounded-full h-10 w-10 lg:h-12 lg:w-12 flex items-center justify-center text-gray-500 text-xl font-semibold">
                                        2
                                    </div>
                                    <p class="text-gray-500 font-bold ml-4">Upload files</p>
                                </div>
                                <div class="w-full flex items-center mt-4">
                                    <div class="border-2 border-gray-500 rounded-full h-10 w-10 lg:h-12 lg:w-12 flex items-center justify-center text-gray-500 text-xl font-semibold">
                                        3
                                    </div>
                                    <p class="text-gray-500 font-bold ml-4">Contact information</p>
                                </div>
                                <div class="w-full flex items-center mt-4">
                                    <div class="border-2 border-gray-500 rounded-full h-10 w-10 lg:h-12 lg:w-12 flex items-center justify-center text-gray-500 text-xl font-semibold">
                                        4
                                    </div>
                                    <p class="text-gray-500 font-bold ml-4">Confirm your request</p>
                                </div>
                                <div class="hidden lg:flex flex-grow">
                                </div>
                                <button
                                class="py-2 mt-8 w-full shadow-md no-underline rounded bg-blue-500 text-white font-bold text-sm hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
                                >
                                Next
                                </button>
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
  name: "form_modal",
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
