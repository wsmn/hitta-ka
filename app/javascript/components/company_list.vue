<template>
  <div class="w-full mx-auto">
    <div class="w-full flex justify-center h-24">
      <div class="w-full px-10 mt-4"></div>
    </div>
    <div class="px-10 companylist overflow-auto">
      <div
        v-for="company in companies"
        :key="company.company_id"
        class="bg-white hover:bg-blue-600 text-blue-900 hover:text-white rounded p-2 mb-6"
        :class="{'bg-blue-400': company == currentCompany}"
        @click="handleClick(company)"
      >
        <div class="flex items-center p-1">
          <div
            class="bg-blue-400 rounded-full h-16 w-16 flex items-center justify-center text-white font-bold mr-4"
          >Logo</div>
          <div class="w-3/4">
            <p class="font-semibold text-lg">{{ company.name }}</p>
            <p class="text-sm font-light font-sans">{{ company.address }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyList",
  props: ["companies", "currentCompany"],
  methods: {
      handleClick(company) {
          this.$emit('select', company.id);
      }
  }
};
</script>
