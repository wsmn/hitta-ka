<template>
  <div
    class="w-full lg:w-1/3 xxl:w-1/4 p-10 flex flex-col bg-white xl:rounded-r border-t border-r border-b border-gray-500"
  >
    <div v-if="company">
      <div class="w-full flex mr-2">
        <div class>
          <div
            class="bg-red-400 rounded-lg h-16 w-16 lg:h-20 lg:w-20 xxl:h-24 xxl:w-24 flex items-center justify-center text-white font-bold"
          >Logo</div>
        </div>
        <div class="w-11/12 ml-4">
          <p class="font-bold text-xl xxl:text-2xl text-blue-900">{{ company.name }}</p>
          <p class="text-sm xxl:text-lg text-blue-900 mt-1 font-light">{{ company.address }}</p>
        </div>
      </div>
      <div class="flex-col mt-10 xxl:mt-12">
        <p class="font-semibold text-xl xxl:text-2xl text-blue-900">About the company</p>
        <p class="text-sm xxl:text-base text-gray-600 mt-2">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sed
          viverra ipsum nunc aliquet bibendum enim. In massa tempor nec feugiat.
          Nunc aliquet bibendum enim facilisis gravida.
          <a
            href="#"
            class="text-blue-400"
          >Läs mer...</a>
        </p>
        <ul class="mt-8 xxl:mt-10">
          <li>
            <div class="w-5 inline-block text-center text-xl xxl:text-2xl">
              <i class="fas fa-map-marker-alt text-blue-900 mt-2 fa-2xl"></i>
            </div>
            <div class="text-gray-600 inline ml-2 text-sm xxl:text-base">Helsingborg</div>
          </li>
          <li class="-mt-1">
            <div class="w-4 inline-block text-center text-xl xxl:text-2xl">
              <i class="fas fa-car text-blue-900 mt-2 fa-2xl"></i>
            </div>
            <div
              class="text-gray-600 inline ml-3 text-sm xxl:text-base"
            >Helsingborg, Höganäs, Klippan, Lund</div>
          </li>
          <li class="-mt-1">
            <div class="w-4 inline-block text-center text-xl xxl:text-2xl">
              <i class="fas fa-user-tie text-blue-900 mt-2 fa-2xl"></i>
            </div>
            <div
              class="text-gray-600 inline ml-3 text-sm xxl:text-base"
            >Certifierad kontrollansvarig, Projektledare</div>
          </li>
        </ul>
      </div>
      <div class="w-full flex mt-12">
        <div class="w-1/2 px-2">
          <button
            class="py-2 w-full shadow-md no-underline rounded-lg bg-blue-700 text-white font-semibold text-sm xxl:text-base hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
          >Förfrågan</button>
        </div>
        <div class="w-1/2 px-2">
          <modal-button
            class-name="py-2 w-full shadow-md no-underline rounded-lg bg-green-500 text-white font-semibold text-sm xxl:text-base hover:text-white hover:bg-green-400 focus:outline-none active:shadow-none"
          ></modal-button>
        </div>
      </div>
    </div>
    <div v-else>
      <div style="height=600px">
        <div class="w-full flex items-center mr-2 items-center">
          <div class="">
            <div class="border-2 border-gray-800 rounded-lg h-12 w-12 lg:h-12 lg:w-12 flex items-center justify-center text-gray-800 text-3xl font-bold">
              1
            </div>
          </div>
          <div class="w-11/12 ml-5">
            <p class="text-sm xl:text-base font-light text-blue-900">
              Klicka på ett företag på kartan eller i listan om du vill läsa mer om det.
            </p>
          </div>
        </div>
        <div class="w-full flex items-center mr-2 mt-12">
          <div class="">
            <div class="bg-gray-800 rounded-lg h-12 w-12 lg:h-12 lg:w-12 flex items-center justify-center text-white text-3xl font-bold">
              2
            </div>
          </div>
          <div class="w-11/12 ml-4">
            <p class="text-sm xl:text-base font-light text-blue-900">
              Där ser du vilken kommun företaget är registrerat i samt vilka kommuner företaget utför arbeten i.
            </p>
          </div>
        </div>
        <div class="w-full flex items-center mr-2 mt-12">
          <div class="">
            <div class="border-2 border-gray-800 rounded-lg h-12 w-12 lg:h-12 lg:w-12 flex items-center justify-center text-gray-800 text-3xl font-bold">
              3
            </div>
          </div>
          <div class="w-11/12 ml-4">
            <p class="text-sm xl:text-base font-light text-blue-900">
              Väljer du att skicka en förfrågan kan du göra detta till max tre företag samtidigt.
            </p>
          </div>
        </div>
        <div class="w-7/12 flex mx-auto flex items-center mt-2">
          <div class="max-w-xs mx-auto mt-8">
            <img v-bind:src="require('images/message_map.svg')" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanySidebar",
  props: ["company"],
  data: () => ({})
};
</script>
