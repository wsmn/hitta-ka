<template>
  <transition name="slide">
    <div
      v-if="show"
      class="hidden relative lg:flex company-info z-10 -ml-1 bg-white rounded-r border border-gray-300" id="width-of-sidebar"
    >
            <button
          class="absolute z-20 top-0 right-0 -mt-2 -mr-2 w-8 h-8 border border-gray-800 rounded bg-white hover:bg-gray-400 hover:border-gray-300 hover:text-white"
          @click="close"
        >
          X
        </button>
      <div class="w-full relative p-2 xl:p-6 pt-8 flex flex-col">
        <div class="w-full flex mr-2">
          <div>
            <div
              class="bg-red-400 rounded-lg h-16 w-16 xl:h-20 xl:w-20 xxl:h-24 xxl:w-24 flex items-center justify-center text-white font-bold"
            >
              Logo
            </div>
          </div>
          <div class="w-11/12 ml-2 xl:ml-4">
            <p class="font-bold text-xl xxl:text-2xl text-blue-900">
              {{ company.name }}
            </p>
            <p class="text-sm xxl:text-lg text-blue-900 mt-1 font-light">
              {{ company.address }}
            </p>
          </div>
        </div>
        <div class="flex-col mt-4 xl:mt-10 xxl:mt-12">
          <p class="font-semibold text-lg xl:text-xl xxl:text-2xl text-blue-900">
            About the company
          </p>
          <p class="text-sm xxl:text-base text-gray-600 mt-2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sed
            viverra ipsum nunc aliquet bibendum enim. In massa tempor nec feugiat.
            <a href="#" class="text-blue-400">Läs mer...</a>
          </p>
          <ul class="mt-4 xl:mt-8 xxl:mt-10">
            <li>
              <div class="w-5 inline-block text-center text-xl xxl:text-2xl">
                <i class="fas fa-map-marker-alt text-blue-900 mt-2 fa-2xl"></i>
              </div>
              <div class="text-gray-600 inline ml-2 text-sm xxl:text-base">
                Helsingborg
              </div>
            </li>
            <li class="-mt-1">
              <div class="w-4 inline-block text-center text-xl xxl:text-2xl">
                <i class="fas fa-car text-blue-900 mt-2 fa-2xl"></i>
              </div>
              <div class="text-gray-600 inline ml-3 text-sm xxl:text-base">
                Helsingborg, Höganäs, Klippan, Lund
              </div>
            </li>
            <li class="-mt-1">
              <div class="w-4 inline-block text-center text-xl xxl:text-2xl">
                <i class="fas fa-user-tie text-blue-900 mt-2 fa-2xl"></i>
              </div>
              <div class="text-gray-600 inline ml-3 text-sm xxl:text-base">
                Certifierad kontrollansvarig, Projektledare
              </div>
            </li>
          </ul>
        </div>
        <div class="w-full flex mt-4 xl:mt-6">
          <div class="w-1/2 px-2">
            <form-modal :company="company"></form-modal>
          </div>
          <div class="w-1/2 px-2">
            <message-modal :company="company"></message-modal>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "CompanyInfo",
  props: ["company", "show"],
  data: () => ({}),
  methods: {
    close() {
      this.$emit("close");
    }
  }
};
</script>

<style scoped>
.slide-enter-active,
.slide-leave-active {
  transition: 0.5s;
}

.slide-enter {
  transform: translate(-100%, 0);
}

.slide-leave-to {
  transform: translate(-100%, 0);
}
</style>
