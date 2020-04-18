<template>
  <div v-if="company">
    <div
      class="w-full p-2 border border-gray-500 rounded-lg md:p-5"
    >
      <div class="flex items-center justify-between h-12">
        <div class="flex flex-row">
          <div class="">
            <div
              class="flex items-center justify-center w-10 h-10 mr-2 text-xs font-bold text-white bg-red-400 rounded-full"
            >
              Logo
            </div>
          </div>
          <div class="">
            <h3 class="text-base font-semibold text-gray-900">
              {{ company.name }}
            </h3>
            <p class="text-xs text-gray-700">Company address</p>
          </div>
        </div>
        <div class="flex">
          <button
            class="w-full px-1 text-xs text-green-500 no-underline border border-green-500 rounded-full shadow-md hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
          >
            Message
          </button>
          <button
            class="w-full px-1 ml-2 text-xs text-blue-500 no-underline border border-blue-500 rounded-full shadow-md hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
          >
            Förfrågan
          </button>
        </div>
      </div>
      <div class="pt-3 text-sm leading-tight">
        <div>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua.
          <a href="#" class="text-blue-400">Läs mer...</a>
        </div>
        <div class="flex items-center mt-2">
          <div class="inline-block w-5 text-lg text-center">
            <i class="mt-2 text-gray-600 fas fa-map-marker-alt fa-2xl"></i>
          </div>
          <div class="inline mt-2 ml-1 text-sm text-center text-gray-700">
            Helsingborg
          </div>
        </div>
        <div class="flex items-center">
          <div class="inline-block w-5 text-lg text-center">
            <i class="mt-2 text-gray-600 fas fa-car fa-2xl"></i>
          </div>
          <div class="inline mt-2 ml-1 text-sm text-center text-gray-700">
            Helsingborg, Höganäs, Klippan, Lund
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyPopup",
  props: ["company"]
};
</script>
