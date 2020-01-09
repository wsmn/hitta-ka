<template>
  <div class="rounded-lg w-auto bg-gray-900 shadow-md text-center mx-auto p-2 md:p-3 text-white">
    <div class="flex justify-between items-center">
      <div>
        <p class="font-semibold text-white text-sm md:text-lg text-left">Skicka förfrågan!</p>
      </div>
      <div class="pr-0">
        <button
            class="ml-1 px-1 w-full shadow-md no-underline rounded-full text-white border bg-blue-500 border-blue-500 text-xs md:text-sm hover:text-white hover:bg-blue-400 focus:outline-none active:shadow-none"
          >
            Skicka
          </button>
      </div>
    </div>
    <div class="flex items-center p-1 border-2 border-dashed border-gray-500 rounded mt-2 h-10 justify-center">
        <p class="font-normal text-sm md:text-base text-center">Lägg till företag +</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "EnquiryList",
  props: ["company"]
};
</script>
