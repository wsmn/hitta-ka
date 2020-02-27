<template>
  <div class="">
    <div class="flex-shrink-0 pr-4 lg:hidden">
      <button
        ref="openButton"
        @click="open"
        type="button"
        class="block text-gray-300 focus:outline-none hover:text-white"
        aria-label="Menu"
      >
        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
        </svg>
      </button>
    </div>

    <div v-cloak>
      <div class="lg:hidden">
        <transition
          enter-class="opacity-0"
          enter-active-class="ease-out transition-medium"
          enter-to-class="opacity-100"
          leave-class="opacity-100"
          leave-active-class="ease-out transition-medium"
          leave-to-class="opacity-0"
          appear
        >
          <div v-show="isOpen" class="z-10 fixed inset-0 transition-opacity">
            <div @click="close" class="absolute inset-0 bg-black opacity-50" tabindex="-1"></div>
          </div>
        </transition>

        <!-- Off-canvas menu -->
        <transition
          enter-class="translate-x-full"
          enter-active-class="ease-out transition-slow"
          enter-to-class="translate-x-0"
          leave-class="translate-x-0"
          leave-active-class="ease-in transition-medium"
          leave-to-class="translate-x-full"
          appear
        >
          <div
            v-show="isOpen"
            class="z-50 fixed inset-y-0 right-0 max-w-xs w-full bg-white border-l border-gray-400 transition-transform overflow-y-auto"
          >
            <div class="relative z-50 bg-white">
              <div :class="isOpen ? 'block' : 'hidden'" class="absolute top-0 right-0 p-4">
                <button
                  ref="closeButton"
                  @click="close"
                  type="button"
                  class="text-gray-600 focus:outline-none focus:text-gray-900"
                  aria-label="Close"
                >
                  <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                    <path
                      d="M18.2929 19.7071C18.6834 20.0976 19.3166 20.0976 19.7071 19.7071C20.0976 19.3166 20.0976 18.6834 19.7071 18.2929L13.4142 12L19.7071 5.70711C20.0976 5.31658 20.0976 4.68342 19.7071 4.29289C19.3166 3.90237 18.6834 3.90237 18.2929 4.29289L12 10.5858L5.70711 4.29289C5.31658 3.90237 4.68342 3.90237 4.29289 4.29289C3.90237 4.68342 3.90237 5.31658 4.29289 5.70711L10.5858 12L4.29289 18.2929C3.90237 18.6834 3.90237 19.3166 4.29289 19.7071C4.68342 20.0976 5.31658 20.0976 5.70711 19.7071L12 13.4142L18.2929 19.7071Z"
                    />
                  </svg>
                </button>
              </div>
              <div class="px-4 pt-4 pb-6">
                <a href="/">
                  <img
                    v-bind:src="require('images/apti_logo.svg')"
                    alt="Home"
                    style="width: 3.75rem"
                  />
                </a>
                <p
                  class="mt-8 block text-xs font-semibold text-gray-600 uppercase tracking-wider"
                >Länkar</p>
                <a
                  v-for="link in processedLinks"
                  :key="link.name"
                  :href="link.url"
                  class="mt-4 block font-medium text-gray-900 hover:text-gray-600"
                >{{ link.name }}</a>
              </div>
              <div class="border-t-2 border-gray-200 px-4 pt-6">
                <div v-if="signedIn" class="flex flex-col">
                  <div class="w-full mb-4">
                    <p class="block text-xs font-semibold text-green-600 uppercase tracking-wider">Konto</p>
                                    <a
                  v-for="accountLinks in accountLinkss"
                  :key="accountLinks.name"
                  :href="accountLinks.url"
                  class="mt-4 text-sm font-medium block text-gray-900 hover:text-gray-600"
                >{{ accountLinks.name }}</a>
                  </div>
                  <div class="flex flex-row">
                    <a :key="accountLink.name"
                      :href="accountLink.url"
                      class="bg-blue-100 hover:bg-blue-200 border border-gray-400 py-2 px-3 rounded mr-3"
                    >
                      <i class="fas fa-user mr-1 text-black"></i>
                      {{ accountLink.name }}
                    </a>
                    <form class="flex" method="post" :action="signOut.url">
                      <input type="hidden" name="_method" value="delete">
                      <input type="hidden" name="authenticity_token" :value="authenticity">
                      <button class="text-gray-900 hover:text-gray-600 border border-gray-400 py-2 px-3 rounded mr-3">
                        <i class="fas fa-sign-out-alt mr-1 text-black"></i>
                        {{ signOut.name }}
                      </button>
                    </form>
                  </div>
                </div>
                <div v-else>
                  <a :key="connectLink.name"
                    :href="connectLink.url"
                    class="bg-blue-100 hover:bg-blue-200 border border-gray-400 py-2 px-3 rounded mr-3"
                  >{{ connectLink.name }}</a>
                  <a :key="signIn.name"
                    :href="signIn.url"
                    class="text-gray-900 hover:text-gray-600 border border-gray-400 py-2 px-3 rounded mr-3"
                  >
                    <i class="fas fa-sign-in-alt mr-1 text-black"></i>
                    {{ signIn.name }}
                  </a>
                </div>
              </div>
            </div>
          </div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Navigation',
  data() {
    return {
      isOpen: false
    };
  },
  props: ["signedIn", "links", "signIn", "signOut", "accountLink", "accountLinks", "connectLink", "authenticity"],
  computed: {
    processedLinks: function() {
      if (typeof this.links == String) {
        return JSON.parse(this.links);
      } else {
        return this.links;
      }
    },
    accountLinkss: function() {
      if (typeof this.accountLinks == String) {
        return JSON.parse(this.accountLinks);
      } else {
        return this.accountLinks;
      }
    }
  },
  methods: {
    open() {
      this.isOpen = true;
      this.$nextTick(() => {
        this.$refs.closeButton.focus();
      });
    },
    close() {
      this.isOpen = false;
      this.$nextTick(() => {
        this.$refs.openButton.focus();
      });
    },
  },
  watch: {
    isOpen: {
      immediate: true,
      handler(isOpen) {
        if (isOpen) {
          document.body.style.setProperty("overflow", "hidden");
        } else {
          document.body.style.removeProperty("overflow");
        }
      }
    }
  }
};
</script>
