<template>
  <div class="w-full mx-auto">
    <div class="w-full flex justify-center md:h-16 lg:h-16 xl:h-24">
      <div class="w-full md:px-10 lg:px-4 xl:px-8 mt-0 lg:-mt-4 xl:mt-4">
        <form @submit.prevent="handleSearch">
          <div
            class="flex items-center w-full px-3 py-2 mx-auto bg-white shadow rounded-none md:rounded-sm"
          >
            <i
              v-if="hasSearchValue"
              @click="resetSearch"
              class="fas fa-times-circle mr-3"
            ></i>
            <input
              type="text"
              id="text"
              placeholder="Län, kommun, stad"
              aria-label="text"
              v-model="searchValue"
              class="w-full mx-auto appearance-none focus:outline-none"
            />
            <button
              type="submit"
              name="commit"
              class="py-2 px-2 w-16 uppercase shadow-md no-underline rounded bg-blue-600 text-white font-bold text-xs hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
            >
            Sök
            </button>
          </div>
        </form>
      </div>
    </div>
    <div v-if="companies.length" class="px-4 xl:px-8 companylist overflow-auto py-4 hidden lg:block">
      <div
        v-for="company in companies"
        :key="company.company_id"
        class="bg-white hover:bg-blue-600 text-blue-900 hover:text-white rounded p-2 mb-6"
        :class="{ 'bg-blue-400': company == currentCompany }"
        @click="handleClick(company)"
        >
        <div class="flex items-center p-1">
          <div class="bg-red-400 rounded-full h-12 w-12 xl:h-16 xl:w-16 flex items-center justify-center text-white text-sm xl:text-base font-bold mr-4">
            Logo
          </div>
          <div class="w-3/4">
            <p class="font-semibold text-md">{{ company.name }}</p>
            <p class="text-sm font-light font-sans">{{ company.address }}</p>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="w-2/3 mx-auto companylist overflow-auto text-center">
      <div v-if="searchValue" class="mt-4">
        <span class="text-base xl:text-lg text-white">
          Inga resultat, prova att söka på någonting annat!
        </span>
        <div class="w-2/3 xl:w-1/2 mx-auto mt-8">
          <img v-bind:src="require('images/company_empty.svg')" />
        </div>
      </div>
      <span v-else class="text-white">
        Det finns inga företag att hitta ännu.
      </span>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyList",
  props: ["companies", "currentCompany", "initialSearch"],
  data: () => ({
    searchValue: ""
  }),
  mounted() {
    this.searchValue = this.initialSearch;
  },
  methods: {
    handleClick(company) {
      this.$emit("select", company.id);
    },
    handleSearch() {
      this.$emit("search", this.searchValue);
    },
    resetSearch() {
      this.searchValue = "";
      this.$emit("search", "");
    }
  },
  computed: {
    hasSearchValue() {
      return this.searchValue != "";
    }
  }

};
</script>
