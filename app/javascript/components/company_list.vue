<template>
  <div
    class="z-20 flex p-2 md:p-4 relative bg-gray-900 shadow-xl rounded-lg ml-6 mt-6 mb-6 border border-gray-400"
    :class="{
      'w-1/3': shouldExpand,
      'w-1/4': !shouldExpand,
    }"
  >
    <div
      class="flex flex-col flex-grow-1"
      :class="{
        'w-full': !shouldExpand,
        'w-1/2': shouldExpand
      }"
    >
      <div class="md:px-10 lg:px-4 xl:px-8 mt-0 lg:-mt-4 xl:mt-2">
        <div class="mb-6">
          <h1 class="text-3xl inline text-white font-thin">
            Sök
          </h1>
          <h1 class="font-bold text-3xl text-white inline ml-1">Kontrollansvariga</h1>
        </div>
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
              id="search-field"
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
        <div class="pt-8 pb-4">
          <h2 class="font-bold text-white text-2xl inline">
            Hela Sverige
          </h2>
          <p class="text-lg text-gray-500 inline ml-2">123 results</p>
        </div>
      </div>
      <div class="hidden lg:block">
        <loading-progress :active="loading" />
      </div>
      <div v-if="companies.length" class="px-4 xl:px-8 companylist overflow-auto py-4 hidden lg:block">
        <div
          v-for="company in companies"
          :key="company.company_id"
          class="bg-white hover:bg-blue-400 text-blue-900 hover:text-white rounded p-2 mb-6 shadow-lg animate-company"
          :class="{ 'bg-blue-600': company == currentCompany }"
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
          <div v-if="company == currentCompany" class="justify-center">
            <button @click="readMore" class="py-2 w-full shadow-md no-underline rounded bg-blue-700 text-white font-semibold text-sm xxl:text-base hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none">
              Läs mer
            </button>
          </div>
        </div>
      </div>
      <div v-else class="w-2/3 mx-auto companylist overflow-auto text-center">
        <div v-if="searchValue" class="mt-4">
          <span class="text-base xl:text-lg text-gray-900">
            Inga resultat, prova att söka på någonting annat!
          </span>
          <div class="w-2/3 xl:w-1/2 mx-auto mt-8">
            <img v-bind:src="require('images/company_empty.svg')" />
          </div>
        </div>
        <span v-if="loading" class="text-white">
          Laddar in företag.
        </span>
      </div>
    </div>
    <company-info v-if="shouldExpand" @close="closeInfo" :company="currentCompany"></company-info>
  </div>
</template>

<script>
export default {
  name: "CompanyList",
  props: ["companies", "currentCompany", "initialSearch", "loading"],
  data: () => ({
    searchValue: "",
    expanded: false,
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
    readMore() {
      this.expanded = !this.expanded;
    },
    resetSearch() {
      this.searchValue = "";
      this.$emit("search", "");
    },
    closeInfo() {
      this.expanded = false;
      this.$emit("select", null);
    }
  },
  computed: {
    hasSearchValue() {
      return this.searchValue != "";
    },
    shouldExpand() {
      return this.currentCompany != null && this.expanded;
    }
  }
};
</script>
