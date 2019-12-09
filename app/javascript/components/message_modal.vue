<template>
  <div>
    <button
      @click="open"
      class="py-2 w-full shadow-md no-underline rounded bg-green-500 text-white font-semibold text-sm xxl:text-base hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
    >
      Meddelande
    </button>
    <modal v-if="showModal" name="message-modal" @close="close">
      <div class="w-full lg:w-1/2 xl:w-1/3 mx-auto p-4 lg:p-0">
        <form
          class="w-full mx-auto bg-white shadow-xl rounded-lg mt-8 max-w-2xl"
          @submit="checkForm" @click.stop
        >
          <div class="w-full flex border-b border-gray-400 p-5 items-center">
            <div class="w-3/4 md:w-4/5 lg:w-5/6">
              <p class="font-bold text-base lg:text-lg text-gray-800">
                Skicka meddelande till
              </p>
              <p
                class="font-bold leading-tight text-base lg:text-lg text-blue-500"
              >
                {{ company.name }}
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
                  <h2
                    class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0 mt-4"
                  >
                    Namn
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3 flex flex-wrap">
                <div class="w-1/2 pr-2">
                  <h2
                    class="tracking-wide leading-none text-gray-700 text-sm font-semibold mb-1 lg:mb-2"
                  >
                    Förnamn
                  </h2>
                  <input
                    :class="{ 'border-red-500 border-4': errors.length }"
                    class="text-sm appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    id="name"
                    v-model="name"
                    name="name"
                    type="text"
                  />
                  <p
                    v-if="errors.length"
                    class="text-red-500 text-xs -mt-5 italic"
                  >
                    Var god fyll i namn.
                  </p>
                </div>
                <div class="w-1/2 pl-2">
                  <h2
                    class="tracking-wide leading-none text-gray-700 text-sm font-semibold mb-1 lg:mb-2"
                  >
                    Efternamn
                  </h2>
                  <input
                    :class="{ 'border-red-500': errors.length }"
                    class="text-sm appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    id="lastname"
                    type="text"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap mb-6 items-center">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0"
                  >
                    Telefonnummer
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    class="text-sm appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    id="phone"
                    v-model="phone"
                    type="phone"
                    name="phone"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap mb-6 items-center">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0"
                  >
                    Email
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    :class="{ 'border-red-500': errors.length }"
                    class="text-sm appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    id="email"
                    v-model="email"
                    type="email"
                    name="email"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap mb-6 items-center">
              <div class="w-full lg:w-1/3">
                <div class="pr-2">
                  <h2
                    class="text-sm lg:text-base text-gray-700 font-semibold mb-1 lg:mb-0"
                  >
                    Ämne
                  </h2>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <input
                    class="text-sm appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                    id="grid-email-adress"
                    type="text"
                  />
                </div>
              </div>
            </div>
            <div class="flex flex-wrap">
              <div class="w-full lg:w-1/3">
                <div class="pr-1">
                  <h2 class="text-sm lg:text-base text-gray-700 font-semibold">
                    Meddelande
                  </h2>
                  <p
                    class="text-xs lg:text-sm font-semibold lg:mt-1 text-gray-500 mb-1 lg:mb-0"
                  >
                    Här skriver du ditt meddelande till företaget. Max 1000 ord.
                  </p>
                </div>
              </div>
              <div class="w-full lg:w-2/3">
                <div class="w-full">
                  <textarea
                    class="text-sm appearance-none resize-none block w-full bg-gray-200 text-gray-700 border border-gray-300 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500 h-24"
                    id="subject"
                    type="description"
                  >
                  </textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="w-full flex border-t border-gray-300 py-5 px-5">
            <div class="w-full flex justify-end items-center">
              <div class="w-20 mr-2">
                <button
                  @click="close"
                  class="w-full text-blue-600 uppercase font-bold text-sm hover:text-blue-300"
                >
                  Avbryt
                </button>
              </div>
              <div class="w-20">
                <button
                  type="submit"
                  value="Submit"
                  class="py-2 px-2 w-full uppercase shadow-md no-underline rounded bg-blue-600 text-white font-bold text-sm hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
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
