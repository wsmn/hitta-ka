<template>
  <div>
    <button
      @click="open"
      class="w-full py-2 text-sm font-semibold text-white no-underline bg-blue-700 rounded shadow-md hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
    >Förfrågan</button>
    <modal name="form-modal" v-if="showModal" @close="close">
      <div class="flex flex-wrap w-full p-4 text-left lg:p-0">
        <div
          class="container flex flex-wrap mx-auto bg-gray-100 border border-gray-400 rounded-lg"
          @click.stop
        >
          <div class="w-full p-6 bg-white border-b border-gray-400 rounded-t-lg lg:p-8">
            <div class="flex justify-between">
              <div class>
                <h1 class="text-3xl font-bold text-left text-gray-900">Skicka förfrågan</h1>
              </div>
              <div class="w-20 lg:w-24">
                <img v-bind:src="require('images/message_map.svg')" />
              </div>
            </div>
            <div class="mt-6 lg:mt-10">
              <div class="flex -mx-2 lg:-mx-3">
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="h-1 bg-blue-500"></div>
                  <p class="mt-4 text-left text-blue-500">Steg 1</p>
                  <p class="text-left text-black">Företag</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="h-1 bg-gray-400" :class="{'bg-blue-500': step != 0}"></div>
                  <p
                    class="mt-4 text-left text-gray-600"
                    :class="{'text-blue-500': step != 0}"
                  >Steg 2</p>
                  <p class="text-left text-black">Fyll i uppgifter</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="h-1 bg-gray-400" :class="{'bg-blue-500': step == 2 || step == 3}"></div>
                  <p
                    class="mt-4 text-left text-gray-600"
                    :class="{'text-blue-500': step == 2 || step == 3}"
                  >Steg 3</p>
                  <p class="text-left text-black">Granska din förfrågan</p>
                </div>
                <div class="w-1/4 px-2 lg:px-3">
                  <div class="h-1 bg-gray-400" :class="{'bg-blue-500': step === 3}"></div>
                  <p
                    class="mt-4 text-left text-gray-600"
                    :class="{'text-blue-500': step === 3}"
                  >Steg 4</p>
                  <p class="text-left text-black">Skicka förfrågan</p>
                </div>
              </div>
            </div>
          </div>
          <div v-if="step == 0" class="w-full p-12">
            <div class="flex justify-between w-full">
              <div class="hidden w-1/3 mt-6 lg:flex">
                <div class="w-5/6">
                  <h2 class="text-2xl font-semibold">Valda företag</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Här visas de företag du valt att skicka förfrågan till. Du kan skicka en förfrågan till upp till tre företag.</p>
                </div>
              </div>
              <div class="w-full bg-white rounded shadow-md lg:w-1/2">
                <div class="flex w-full bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 border border-gray-400 rounded-t">
                    <h2 class="text-lg font-semibold text-gray-900">Valda företag</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Här visas de företag du valt att skicka förfrågan till. Du kan skicka en förfrågan till upp till tre företag.</p>
                  </div>
                </div>
                <div class="flex flex-col px-8 pt-6 pb-8 my-2 mb-4">
                  <div class="mb-6 -mx-3">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="font-bold tracking-wide text-gray-800">Företag 1</label>
                      <div class="w-full h-24 mt-2 border-2 border-gray-500 border-dashed"></div>
                    </div>
                  </div>
                  <div class="flex flex-wrap mb-6 -mx-3">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="font-bold tracking-wide text-gray-800">Företag 2</label>
                      <div class="w-full h-24 mt-2 border-2 border-gray-500 border-dashed"></div>
                    </div>
                  </div>
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full px-3 mb-6 md:mb-0">
                      <label class="font-bold tracking-wide text-gray-800">Företag 3</label>
                      <div class="w-full h-24 mt-2 border-2 border-gray-500 border-dashed"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div
            v-if="step === 1"
            class="w-full px-4 py-8 overflow-scroll lg:py-12 lg:px-16 step_two_body"
          >
            <div class="flex w-full">
              <div class="hidden w-1/3 mt-6 lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Dina kontaktuppgifter</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Ange dina kontaktuppgifter så att företaget kan nå dig och svara på din förfrågan.</p>
                </div>
              </div>
              <div class="w-full bg-white border border-gray-300 rounded shadow-md lg:w-2/3">
                <div class="flex w-full bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 border border-gray-400 rounded-t">
                    <h2 class="text-lg font-semibold text-gray-900">Dina kontaktuppgifter</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Ange dina kontaktuppgifter så att företaget kan nå dig och svara på din förfrågan.</p>
                  </div>
                </div>
                <div class="flex flex-col px-8 pt-6 pb-6 my-2 mb-4">
                  <div class="mb-6 -mx-3 md:flex">
                    <div class="px-3 mb-6 md:w-1/2 md:mb-0">
                      <label class="inline font-bold tracking-wide text-gray-800">
                        Förnamn
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                    <div class="w-full px-3 md:w-1/2">
                      <label class="font-bold tracking-wide text-gray-800">
                        Efternamn
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="mb-6 -mx-3 md:flex">
                    <div class="px-3 mb-6 md:w-1/3 md:mb-0">
                      <label class="inline font-bold tracking-wide text-gray-800">
                        Adress
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                    <div class="w-full px-3 mb-6 md:w-1/3 md:mb-0">
                      <label class="inline font-bold tracking-wide text-gray-800">
                        Stad
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        type="text"
                      />
                    </div>
                    <div class="w-full px-3 md:w-1/3">
                      <label class="inline font-bold tracking-wide text-gray-800">
                        Postnummer
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="mb-6 -mx-3 md:flex">
                    <div class="px-3 mb-6 md:w-1/2 md:mb-0">
                      <label class="inline font-bold tracking-wide text-gray-800">
                        E-mail
                        <p class="inline text-red-700" title="Mandatory">*</p>
                      </label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                    <div class="w-full px-3 md:w-1/2">
                      <label
                        class="inline font-bold tracking-wide text-gray-800"
                      >Telefonnummer</label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        type="text"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex w-full mt-12 lg:mt-6">
              <div class="hidden w-1/3 mt-6 lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Projektdetaljer</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Här skriver du in detaljer angående projektet så som på vilken adress projektet skall utföras samt projektyp och önskat startdatum.</p>
                </div>
              </div>
              <div class="w-full bg-white rounded shadow-md lg:w-2/3">
                <div class="flex w-full bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 border border-gray-400 rounded-t">
                    <h2 class="text-lg font-semibold text-gray-900">Projektdetaljer</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Här skriver du in detaljer angående projektet så som på vilken adress projektet skall utföras samt projektyp och önskat startdatum.</p>
                  </div>
                </div>
                <div class="flex flex-col px-8 pt-6 pb-8 my-2 mb-4">
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full px-3 mb-6 md:w-1/2">
                      <label
                        class="font-bold tracking-wide text-gray-800"
                      >Välj projekttyp:</label>
                      <div class="relative">
                        <select
                          class="block w-full px-4 py-3 pr-8 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        >
                          <option selected="selected"></option>
                          <option>Nybyggnation</option>
                          <option>Tillbyggnad</option>
                          <option>Renovering</option>
                          <option>Annat</option>
                        </select>
                        <div
                          class="absolute inset-y-0 right-0 flex items-center px-2 text-gray-700 pointer-events-none"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 20 20"
                            class="w-4 h-4 fill-current"
                          >
                            <path
                              d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                            />
                          </svg>
                        </div>
                      </div>
                    </div>
                    <div class="w-full px-3 mb-6 md:w-1/2">
                      <label class="font-bold tracking-wide text-gray-800">Hustyp:</label>
                      <div class="relative">
                        <select
                          class="block w-full px-4 py-3 pr-8 mt-2 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
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
                          class="absolute inset-y-0 right-0 flex items-center px-2 text-gray-700 pointer-events-none"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            viewBox="0 0 20 20"
                            class="w-4 h-4 fill-current"
                          >
                            <path
                              d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
                            />
                          </svg>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="mb-6 -mx-3 md:flex">
                    <div class="px-3 mb-6 md:w-1/2 md:mb-0">
                      <label class="font-bold tracking-wide text-gray-800">Byggaddress</label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-800 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                    <div class="w-full px-3 md:w-1/2">
                      <label class="font-bold tracking-wide text-gray-800">Stad</label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-800 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white"
                        type="text"
                      />
                    </div>
                  </div>
                  <div class="mb-6 -mx-3 md:flex">
                    <div class="px-3 mb-6 md:w-1/2 md:mb-0">
                      <label class="font-bold tracking-wide text-gray-800">Postkod</label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-800 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                    <div class="px-3 mb-6 md:w-1/2 md:mb-0">
                      <label
                        class="font-bold tracking-wide text-gray-800"
                      >Önskad projektstart</label>
                      <input
                        class="block w-full px-4 py-3 mt-2 leading-tight text-gray-800 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                        type="text"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex w-full mt-12 lg:mt-6">
              <div class="hidden w-1/3 mt-6 lg:flex">
                <div class="w-5/6">
                  <h2 class="text-lg font-semibold">Projektbeskrivning</h2>
                  <p
                    class="mt-4 text-gray-700"
                  >Beskriv ditt projekt så noga du kan. Ett väl beskrivet projekt är lättare att estimera tid och kostnad för.</p>
                </div>
              </div>
              <div class="w-full bg-white rounded shadow-md lg:w-2/3">
                <div class="flex w-full bg-gray-300 lg:hidden">
                  <div class="w-full px-8 pt-4 pb-4 border border-gray-400 rounded-t">
                    <h2 class="text-lg font-semibold text-gray-900">Projektbeskrivning</h2>
                    <p
                      class="mt-4 text-gray-700"
                    >Beskriv ditt projekt så noga du kan. Ett väl beskrivet projekt är lättare att estimera tid och kostnad för.</p>
                  </div>
                </div>
                <div class="flex flex-col px-8 pt-6 pb-8 my-2 mb-4">
                  <div class="flex flex-wrap -mx-3">
                    <div class="w-full px-3">
                      <label
                        class="font-bold tracking-wide text-gray-900"
                      >Projektbeskrivning</label>
                      <textarea
                        class="block w-full h-32 px-4 py-3 mt-2 mb-3 leading-tight text-gray-700 bg-gray-100 border border-gray-400 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
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
            <div class="w-3/4 h-64 mx-auto bg-white border border-gray-300 rounded"></div>
          </div>
          <div class="flex w-full px-5 py-5 bg-white border-t border-gray-400 rounded-b-lg">
            <div class="flex items-center justify-end w-full">
              <div class="mr-4">
                <button
                  @click="close"
                  class="w-full text-sm font-bold text-red-800 uppercase hover:text-red-500"
                >Avbryt</button>
              </div>
              <div v-if="step != 0" class="mr-4">
                <button
                  @click="step -= 1"
                  class="w-full px-2 py-2 text-sm font-bold text-blue-600 no-underline uppercase border border-blue-600 rounded shadow-md hover:text-white hover:bg-blue-400 hover:border-blue-400 focus:outline-none active:shadow-none"
                >Föregående</button>
              </div>
              <div v-if="step != 3" class="w-20">
                <button
                  @click="step += 1"
                  class="w-full px-2 py-2 text-sm font-bold text-white no-underline uppercase bg-blue-600 border border-blue-600 rounded shadow-md hover:text-white hover:bg-blue-400 hover:border-blue-400 focus:outline-none active:shadow-none"
                >Nästa</button>
              </div>
              <div v-if="step == 3" class="w-20">
                <button
                  class="w-full px-2 py-2 text-sm font-bold text-white no-underline uppercase bg-green-600 rounded shadow-md hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
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
