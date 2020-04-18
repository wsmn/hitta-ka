<template>
  <transition name="slide">
    <div
      v-if="show"
      class="relative z-10 hidden -ml-1 bg-white border border-gray-300 rounded-r lg:flex company-info" id="width-of-sidebar"
    >
            <button
          class="absolute top-0 right-0 z-20 w-8 h-8 -mt-2 -mr-2 bg-white border border-gray-800 rounded hover:bg-gray-400 hover:border-gray-300 hover:text-white"
          @click="close"
        >
          X
        </button>
      <div class="relative flex flex-col w-full p-6 xl:pt-8">
        <div class="flex w-full mr-2">
          <div>
            <div
              class="flex items-center justify-center w-16 h-16 font-bold text-white bg-red-400 rounded-lg xl:h-20 xl:w-20 xxl:h-24 xxl:w-24"
            >
              Logo
            </div>
          </div>
          <div class="w-11/12 ml-2 xl:ml-4">
            <p class="text-xl font-bold text-blue-900 xxl:text-2xl">
              {{ company.name }}
            </p>
            <p class="mt-1 text-sm font-light text-blue-900 xxl:text-lg">
              {{ company.address }}
            </p>
          </div>
        </div>
        <div class="flex-col mt-4 xl:mt-10 xxl:mt-12">
          <p class="text-lg font-semibold text-blue-900 xl:text-xl xxl:text-2xl">
            About the company
          </p>
          <p class="mt-2 text-sm text-gray-600 xxl:text-base">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sed
            viverra ipsum nunc aliquet bibendum enim. In massa tempor nec feugiat.
            <a href="#" class="text-blue-400">Läs mer...</a>
          </p>
          <ul class="mt-4 xl:mt-8 xxl:mt-10">
            <li>
              <div class="inline-block w-5 text-xl text-center xxl:text-2xl">
                <i class="mt-2 text-blue-900 fas fa-map-marker-alt fa-2xl"></i>
              </div>
              <div class="inline ml-2 text-sm text-gray-600 xxl:text-base">
                Helsingborg
              </div>
            </li>
            <li class="-mt-1">
              <div class="inline-block w-4 text-xl text-center xxl:text-2xl">
                <i class="mt-2 text-blue-900 fas fa-car fa-2xl"></i>
              </div>
              <div class="inline ml-3 text-sm text-gray-600 xxl:text-base">
                Helsingborg, Höganäs, Klippan, Lund
              </div>
            </li>
            <li class="-mt-1">
              <div class="inline-block w-4 text-xl text-center xxl:text-2xl">
                <i class="mt-2 text-blue-900 fas fa-user-tie fa-2xl"></i>
              </div>
              <div class="inline ml-3 text-sm text-gray-600 xxl:text-base">
                Certifierad kontrollansvarig, Projektledare
              </div>
            </li>
          </ul>
        </div>
        <div class="flex w-full mt-4 xl:mt-6">
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
