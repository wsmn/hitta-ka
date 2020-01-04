<template>
  <div
    class="bg-white hover:bg-blue-300 text-blue-900 hover:text-white rounded p-2 mb-6"
    :class="{ '': isCurrent }"
    @click="handleClick"
  >
    <div class="flex items-center p-1">
      <div
        class="bg-red-400 rounded-full h-12 w-12 xl:h-16 xl:w-16 flex items-center justify-center text-white text-sm xl:text-base font-bold mr-4"
      >
        Logo
      </div>
      <div class="w-3/4">
        <p class="font-semibold text-md">{{ company.name }}</p>
        <p class="text-sm font-light font-sans">{{ company.address }}</p>
      </div>
    </div>
    <div v-if="isCurrent">
      <div class="flex-col mt-4 xl:mt-10 xxl:mt-12">
        <p class="font-semibold text-lg xl:text-xl xxl:text-2xl text-blue-900">About the company</p>
        <p class="text-sm xxl:text-base text-gray-600 mt-2">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sed
          viverra ipsum nunc aliquet bibendum enim. In massa tempor nec feugiat.
          <a
            href="#"
            class="text-blue-400"
          >Läs mer...</a>
        </p>
        <ul class="mt-4 xl:mt-8 xxl:mt-10">
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
    </div>
  </div>
</template>

<script>
export default {
  name: "Company",
  props: ["company", "isCurrent"],
  methods: {
    handleClick() {
      this.$emit("select", this.company.id);
    },
  }
};
</script>
