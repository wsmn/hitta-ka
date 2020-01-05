<template>
  <div>
    <button
      @click="open"
      class="py-2 w-full shadow-md no-underline rounded bg-blue-700 text-white font-semibold text-sm hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
    >Förfrågan</button>
    <modal name="form-modal" v-if="showModal" @close="close">
      <div class="w-full flex flex-wrap p-4 lg:p-0 text-left">
        <div
          class="container flex flex-wrap mx-auto bg-gray-100 rounded-lg border border-gray-400"
          @click.stop
        >
          <div class="w-full rounded-t-lg bg-white border-b border-gray-400 p-6 lg:p-8">
            <div class="flex justify-between">
              <div class>
                <h1 class="text-gray-900 font-bold text-3xl text-left">Skicka förfrågan</h1>
              </div>
              <div class="w-20 lg:w-24">
                <img v-bind:src="require('images/message_map.svg')" />
              </div>
            </div>
            <div class="mt-6 lg:mt-10">
              <div class="flex -mx-2 lg:-mx-3">
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="bg-blue-500 h-1"></div>
                  <p class="text-blue-500 text-left mt-4">Steg 1</p>
                  <p class="text-black text-left">Företag</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="bg-gray-400 h-1" :class="{'bg-blue-500': step != 0}"></div>
                  <p
                    class="text-gray-600 text-left mt-4"
                    :class="{'text-blue-500': step != 0}"
                  >Steg 2</p>
                  <p class="text-black text-left">Fyll i uppgifter</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="bg-gray-400 h-1" :class="{'bg-blue-500': step == 2 || step == 3}"></div>
                  <p
                    class="text-gray-600 text-left mt-4"
                    :class="{'text-blue-500': step == 2 || step == 3}"
                  >Steg 3</p>
                  <p class="text-black text-left">Granska din förfrågan</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="bg-gray-400 h-1" :class="{'bg-blue-500': step === 3}"></div>
                  <p
                    class="text-gray-600 text-left mt-4"
                    :class="{'text-blue-500': step === 3}"
                  >Steg 4</p>
                  <p class="text-black text-left">Skicka förfrågan</p>
                </div>
              </div>
            </div>
          </div>
          <div v-if="step == 0" class="w-full p-12">
            <div class="w-full flex justify-between">
              <div class="w-1/3 mt-6 hidden lg:flex">
                <div class="w-5/6">
                  <h2 class="text-2xl font-semibold">Valda företag</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Här visas de företag du valt att skicka förfrågan till. Du kan skicka en förfrågan till upp till tre företag.</p>
                </div>
              </div>
              <div class="w-full lg:w-1/2 bg-white shadow-md rounded">
                <div class="w-full flex bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 rounded-t border border-gray-400">
                    <h2 class="text-lg text-gray-900 font-semibold">Valda företag</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Här visas de företag du valt att skicka förfrågan till. Du kan skicka en förfrågan till upp till tre företag.</p>
                  </div>
                </div>
                <div class="px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                  <div class="-mx-3 mb-6">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold">Företag 1</label>
                      <div class="w-full border-dashed border-2 border-gray-500 h-24 mt-2"></div>
                    </div>
                  </div>
                  <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold">Företag 2</label>
                      <div class="w-full border-dashed border-2 border-gray-500 h-24 mt-2"></div>
                    </div>
                  </div>
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold">Företag 3</label>
                      <div class="w-full border-dashed border-2 border-gray-500 h-24 mt-2"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="step === 1"
            class="w-full py-8 px-4 lg:py-12 lg:px-16 step_two_body overflow-scroll"
          >
            <div class="w-full flex">
              <div class="w-1/3 mt-6 hidden lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Dina kontaktuppgifter</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Ange dina kontaktuppgifter så att företaget kan nå dig och svara på din förfrågan.</p>
                </div>
              </div>
              <div class="w-full lg:w-2/3 bg-white border border-gray-300 shadow-md rounded">
                <div class="w-full flex bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 rounded-t border border-gray-400">
                    <h2 class="text-lg text-gray-900 font-semibold">Dina kontaktuppgifter</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Ange dina kontaktuppgifter så att företaget kan nå dig och svara på din förfrågan.</p>
                  </div>
                </div>
                <div class="px-8 pt-6 pb-6 mb-4 flex flex-col my-2">
                  <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold inline">
                        Förnamn
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                    <div class="w-full md:w-1/2 px-3">
                      <label class="tracking-wide text-gray-800 font-bold">
                        Efternamn
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/3 px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold inline">
                        Adress
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                    <div class="w-full md:w-1/3 mb-6 md:mb-0 px-3">
                      <label class="tracking-wide text-gray-800 font-bold inline">
                        Stad
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                        type="text"
                      />
                    </div>
                    <div class="w-full md:w-1/3 px-3">
                      <label class="tracking-wide text-gray-800 font-bold inline">
                        Postnummer
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold inline">
                        E-mail
                        <p class="text-red-700 inline" title="Mandatory">*</p>
                      </label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                    <div class="w-full md:w-1/2 px-3">
                      <label
                        class="tracking-wide text-gray-800 font-bold inline"
                      >Telefonnummer</label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                        type="text"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="w-full flex mt-12 lg:mt-6">
              <div class="w-1/3 mt-6 hidden lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Projektdetaljer</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Här skriver du in detaljer angående projektet så som på vilken adress projektet skall utföras samt projektyp och önskat startdatum.</p>
                </div>
              </div>
              <div class="w-full lg:w-2/3 bg-white shadow-md rounded">
                <div class="w-full flex bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 rounded-t border border-gray-400">
                    <h2 class="text-lg text-gray-900 font-semibold">Projektdetaljer</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Här skriver du in detaljer angående projektet så som på vilken adress projektet skall utföras samt projektyp och önskat startdatum.</p>
                  </div>
                </div>
                <div class="px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full md:w-1/2 px-3 mb-6">
                      <label
                        class="tracking-wide text-gray-800 font-bold"
                      >Välj projekttyp:</label>
                      <div class="relative">
                        <select
                          class="block appearance-none w-full bg-gray-100 border border-gray-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white mt-2"
                        >
                          <option selected="selected"></option>
                          <option>Nybyggnation</option>
                          <option>Tillbyggnad</option>
                          <option>Renovering</option>
                          <option>Annat</option>
                        </select>
                        <div
                          class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 20 20"
                            class="fill-current h-4 w-4"
                          >
                            <path
                              d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                            />
                          </svg>
                        </div>
                      </div>
                    </div>
                    <div class="w-full md:w-1/2 px-3 mb-6">
                      <label class="tracking-wide text-gray-800 font-bold">Hustyp:</label>
                      <div class="relative">
                        <select
                          class="block appearance-none w-full bg-gray-100 border border-gray-400 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white mt-2"
                        >
                          <option selected="selected"></option>
                          <option>Hus</option>
                          <option>Lägenhet</option>
                          <option>Rashus</option>
                          <option>Fritidshus</option>
                          <option>Industri</option>
                          <option>Kontor</option>
                          <option>Restaurang</option>
                          <option>Annat</option>
                        </select>
                        <div
                          class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 20 20"
                            class="fill-current h-4 w-4"
                          >
                            <path
                              d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                            />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold">Byggaddress</label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-800 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                    <div class="w-full md:w-1/2 px-3">
                      <label class="tracking-wide text-gray-800 font-bold">Stad</label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-800 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white mt-2"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="-mx-3 md:flex mb-6">
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                      <label class="tracking-wide text-gray-800 font-bold">Postkod</label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-800 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                    <div class="md:w-1/2 px-3 mb-6 md:mb-0">
                      <label
                        class="tracking-wide text-gray-800 font-bold"
                      >Önskad projektstart</label>
                      <input
                        class="appearance-none block w-full bg-gray-100 text-gray-800 border border-gray-400 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 mt-2"
                        type="text"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="w-full flex mt-12 lg:mt-6">
              <div class="w-1/3 mt-6 hidden lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Projektbeskrivning</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Beskriv ditt projekt så noga du kan. Ett väl beskrivet projekt är lättare att estimera tid och kostnad för.</p>
                </div>
              </div>
              <div class="w-full lg:w-2/3 bg-white shadow-md rounded">
                <div class="w-full flex bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 rounded-t border border-gray-400">
                    <h2 class="text-lg text-gray-900 font-semibold">Projektbeskrivning</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Beskriv ditt projekt så noga du kan. Ett väl beskrivet projekt är lättare att estimera tid och kostnad för.</p>
                  </div>
                </div>
                <div class="px-8 pt-6 pb-8 mb-4 flex flex-col my-2">
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full px-3">
                      <label
                        class="tracking-wide text-gray-900 font-bold"
                      >Projektbeskrivning</label>
                      <textarea
                        class="appearance-none mt-2 block w-full bg-gray-100 text-gray-700 border border-gray-400 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 h-32"
                        id="subject"
                        type="description"
                      ></textarea>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div v-if="step === 2" class="w-full p-8">
            <div class="w-3/4 bg-white mx-auto h-64 rounded border border-gray-300"></div>
          </div>
          <div class="w-full bg-white rounded-b-lg flex border-t border-gray-400 py-5 px-5">
            <div class="w-full flex justify-end items-center">
              <div class="mr-4">
                <button
                  @click="close"
                  class="w-full text-red-800 uppercase font-bold text-sm hover:text-red-500"
                >Avbryt</button>
              </div>
              <div v-if="step != 0" class="mr-4">
                <button
                  @click="step -= 1"
                  class="py-2 px-2 w-full uppercase shadow-md no-underline rounded border border-blue-600 text-blue-600 font-bold text-sm hover:text-white hover:bg-blue-400 hover:border-blue-400 focus:outline-none active:shadow-none"
                >Föregående</button>
              </div>
              <div v-if="step != 3" class="w-20">
                <button
                  @click="step += 1"
                  class="py-2 px-2 w-full uppercase shadow-md no-underline rounded border border-blue-600 bg-blue-600 text-white font-bold text-sm hover:text-white hover:bg-blue-400 hover:border-blue-400 focus:outline-none active:shadow-none"
                >Nästa</button>
              </div>
              <div v-if="step == 3" class="w-20">
                <button
                  class="py-2 px-2 w-full uppercase shadow-md no-underline rounded bg-green-600 text-white font-bold text-sm hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
                >Skicka</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </modal>
  </div>
</template>

<script>
import Modal from "./modal.vue";

export default {
  name: "form-modal",
  props: ["company"],
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
      showModal: false,
      step: 0
    };
  }
};
</script>

<style scoped>
.step_two_body {
  height: 70vh;
}
</style>
