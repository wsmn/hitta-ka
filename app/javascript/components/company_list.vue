<template>
  <div class="w-full mx-auto">
    <div class="w-full flex justify-center h-24">
      <div class="w-full px-10 mt-4">
        <form @submit.prevent="handleSearch">
          <div
            class="flex items-center w-full p-3 mx-auto bg-white shadow rounded-sm"
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
              class="bg-blue-600 hover:bg-blue-500 border-blue-600 hover:border-blue-500 px-8 rounded-r rounded-l-none text-white font-bold p-3 border-t border-b border-r"
            >
            Sök
            </button>
          </div>
        </form>
      </div>
    </div>
    <div v-if="companies.length" class="px-10 companylist overflow-auto mt-2">
      <div
        v-for="company in companies"
        :key="company.company_id"
        class="bg-white hover:bg-blue-600 text-blue-900 hover:text-white rounded p-2 mb-6"
        :class="{ 'bg-blue-400': company == currentCompany }"
        @click="handleClick(company)"
      >
        <div class="flex items-center p-1">
          <div
            class="bg-blue-400 rounded-full h-16 w-16 flex items-center justify-center text-white font-bold mr-4"
          >
            Logo
          </div>
          <div class="w-3/4">
            <p class="font-semibold text-lg">{{ company.name }}</p>
            <p class="text-sm font-light font-sans">{{ company.address }}</p>
          </div>
        </div>
      </div>
    </div>
    <div v-else class="px-10 companylist overflow-auto">
      <span v-if="searchValue">
      Hittade inga företag, prova att sök på någonting annat!
      </span>
      <span v-else>
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
