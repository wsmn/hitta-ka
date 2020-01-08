<template>
  <div v-if="company">
    <div class="w-full bg-gray-100 border border-gray-500 rounded-lg p-5">
      <div class="flex items-center h-12 justify-between">
        <div class="flex-row flex">
          <div class="">
                        <div
            class="bg-red-400 rounded-full h-10 w-10 flex items-center justify-center text-white text-xs font-bold mr-2"
          >Logo</div>
          </div>
          <div class="">
            <h3 class="text-gray-900 text-base font-semibold">{{ company.name }}</h3>
              <p class="text-gray-700 text-xs">Company address</p>
          </div>
        </div>
        <div class="flex">
          <button
            @click="open"
            class="px-1 w-full shadow-md no-underline rounded-full text-green-500 border border-green-500 text-xs hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
          >
            Message
          </button>
          <button
            @click="open"
            class="ml-2 px-1 w-full shadow-md no-underline rounded-full text-blue-500 border border-blue-500 text-xs hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
          >
            Förfrågan
          </button>
        </div>
      </div>
      <div class="pt-3 text-sm leading-tight">
        <div>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <a href="#" class="text-blue-400">Läs mer...</a>
        </div>
        <div class="flex items-center mt-2">
          <div class="w-5 inline-block text-center text-lg">
            <i class="fas fa-map-marker-alt text-gray-600 mt-2 fa-2xl"></i>
          </div>
          <div class="text-gray-700 text-center inline text-sm mt-2 ml-1">
            Helsingborg
          </div>
        </div>
        <div class="flex items-center">
          <div class="w-5 inline-block text-center text-lg">
            <i class="fas fa-car text-gray-600 mt-2 fa-2xl"></i>
          </div>
          <div class="text-gray-700 text-center inline text-sm mt-2 ml-1">
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
  props: ["company"],
};
</script>
