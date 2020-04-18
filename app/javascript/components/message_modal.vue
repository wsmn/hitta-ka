<template>
  <div>
    <button
      @click="open"
      class="w-full py-2 text-sm font-semibold text-white no-underline bg-green-500 rounded shadow-md xxl:text-base hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
    >
      Meddelande
    </button>
    <modal v-if="showModal" name="message-modal" @close="close">
      <div class="w-full p-4 mx-auto lg:w-1/2 xl:w-1/3 lg:p-0">
        <form
          class="w-full max-w-2xl mx-auto mt-8 bg-white rounded-lg shadow-xl"
          @submit="checkForm" @click.stop
        >
          <div class="flex items-center w-full p-5 border-b border-gray-400">
            <div class="w-3/4 md:w-4/5 lg:w-5/6">
              <p class="text-base font-bold text-gray-800 lg:text-lg">
                Skicka meddelande till
              </p>
              <p
                class="text-base font-bold leading-tight text-blue-500 lg:text-lg"
              >
                {{ company.name }}
              </p>
            </div>
            <div class="flex items-center w-1/4 md:w-1/5 lg:w-1/6">
              <img v-bind:src="require('images/message_map.svg')" />
            </div>
          </div>
          <div class="flex flex-col p-5">
            <div class="flex flex-wrap items-center mb-6">
              <div class="hidden lg:w-1/3 lg:block">
                <div class="pr-2">
                  <h2
                    class="mt-4 mb-1 text-sm font-semibold text-gray-700 lg:text-base lg:mb-0"
                  >
                    Namn
                  </h2>
                </div>
              </div>
              <div class="flex flex-wrap w-full lg:w-2/3">
                <div class="w-1/2 pr-2">
                  <h2
                    class="mb-1 text-sm font-semibold leading-none tracking-wide text-gray-700 lg:mb-2"
                  >
                    Förnamn
                  </h2>
                  <input
                    :class="{ 'border-red-500 border-4': errors.length }"
                    class="block w-full px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="name"
                    v-model="name"
                    name="name"
                    type="text"
                  />
                  <p
                    v-if="errors.length"
                    class="-mt-5 text-xs italic text-red-500"
                  >
                    Var god fyll i namn.
                  </p>
                </div>
                <div class="w-1/2 pl-2">
                  <h2
                    class="mb-1 text-sm font-semibold leading-none tracking-wide text-gray-700 lg:mb-2"
                  >
                    Efternamn
                  </h2>
                  <input
                    :class="{ 'border-red-500': errors.length }"
                    class="block w-full px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="lastname"
                    type="text"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap items-center mb-6">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="mb-1 text-sm font-semibold text-gray-700 lg:text-base lg:mb-0"
                  >
                    Telefonnummer
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    class="block w-full px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="phone"
                    v-model="phone"
                    type="phone"
                    name="phone"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap items-center mb-6">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="mb-1 text-sm font-semibold text-gray-700 lg:text-base lg:mb-0"
                  >
                    Email
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    :class="{ 'border-red-500': errors.length }"
                    class="block w-full px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="email"
                    v-model="email"
                    type="email"
                    name="email"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap items-center mb-6">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="mb-1 text-sm font-semibold text-gray-700 lg:text-base lg:mb-0"
                  >
                    Ämne
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    class="block w-full px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="grid-email-adress"
                    type="text"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap">
              <div class="w-full lg:w-1/3">
                <div class="pr-1">
                  <h2 class="text-sm font-semibold text-gray-700 lg:text-base">
                    Meddelande
                  </h2>
                  <p
                    class="mb-1 text-xs font-semibold text-gray-500 lg:text-sm lg:mt-1 lg:mb-0"
                  >
                    Här skriver du ditt meddelande till företaget. Max 1000 ord.
                  </p>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <textarea
                    class="block w-full h-24 px-4 py-3 text-sm leading-tight text-gray-700 bg-gray-200 border border-gray-300 rounded appearance-none resize-none focus:outline-none focus:bg-white focus:border-gray-500"
                    id="subject"
                    type="description"
                  >
                  </textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="flex w-full px-5 py-5 border-t border-gray-300">
            <div class="flex items-center justify-end w-full">
              <div class="w-20 mr-2">
                <button
                  @click="close"
                  class="w-full text-sm font-bold text-blue-600 uppercase hover:text-blue-300"
                >
                  Avbryt
                </button>
              </div>
              <div class="w-20">
                <button
                  type="submit"
                  value="Submit"
                  class="w-full px-2 py-2 text-sm font-bold text-white no-underline uppercase bg-blue-600 rounded shadow-md hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
                >
                  Skicka
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </modal>
  </div>
</template>

<script>
import Modal from "./modal.vue";

export default {
  name: "message-modal",
  props: ["company"],
  data() {
    return {
      showModal: false,
      errors: [],
      name: null,
      email: null,
      phone: null
    };
  },
  methods: {
    open() {
      this.showModal = true;
    },
    close() {
      this.showModal = false;
    },
    checkForm: function(e) {
      this.errors = [];

      if (!this.name) {
        this.errors.push("Name required.");
      }
      if (!this.email) {
        this.errors.push("Email required.");
      } else if (!this.validEmail(this.email)) {
        this.errors.push("Valid email required.");
      }

      if (!this.errors.length) {
        return true;
      }
      e.preventDefault();
    },
    validEmail: function(email) {
      var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(email);
    }
  }
};
</script>
