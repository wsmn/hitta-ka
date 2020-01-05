<template>
  <div class="rounded-lg w-64 bg-white shadow-md text-center mx-auto p-4">
      <p class="font-semibold text-gray-900 text-xl text-center">Skicka förfrågan!</p>
    <div class="flex items-center p-1 border-2 border-dashed border-gray-500 rounded mt-2 h-12 justify-center">
        <p class="font-normal text-base text-center">Empty</p>
    </div>
    <div class="flex items-center p-1 border-2 border-dashed border-gray-500 rounded mt-2 h-12 justify-center">
        <p class="font-normal text-base text-center">Empty</p>
    </div>
    <div class="flex items-center p-1 border-2 border-dashed border-gray-500 rounded mt-2 text-right h-12 justify-center">
        <p class="text-center">Empty</p>
    </div>
    <div class="w-1/2 mx-auto px-2 mt-4">
        <form-modal :company="company"></form-modal>
    </div>
  </div>
</template>

<script>
export default {
  name: "EnquiryList",
  props: ["company"]
};
</script>
