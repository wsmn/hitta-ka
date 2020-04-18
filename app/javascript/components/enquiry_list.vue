<template>
  <div class="w-auto p-2 mx-auto text-center text-white bg-gray-900 rounded-lg shadow-md md:p-3">
    <div class="flex items-center justify-between">
      <div>
        <p class="text-sm font-semibold text-left text-white md:text-lg">Skicka förfrågan!</p>
      </div>
      <div class="pr-0">
        <button
            class="w-full px-1 ml-1 text-xs text-white no-underline bg-blue-500 border border-blue-500 rounded-full shadow-md md:text-sm hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
          >
            Skicka
          </button>
      </div>
    </div>
    <div class="flex items-center justify-center h-10 p-1 mt-2 border-2 border-gray-500 border-dashed rounded">
        <p class="text-sm font-normal text-center md:text-base">Lägg till företag +</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "EnquiryList",
  props: ["company"]
};
</script>
