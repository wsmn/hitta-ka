<template>
  <div
    class="relative z-20 flex flex-row w-full h-16 px-0 py-0 md:w-auto md:h-32 lg:h-full md:py-2 md:px-2 lg:py-6 lg:pl-6 lg:pr-0"
    :class="{
        '': !shouldExpand,
        'w-1/2': shouldExpand
      }"
  >
    <div
      class="relative z-20 flex flex-col w-full h-auto px-2 py-0 md:w-auto md:py-2 md:px-4 lg:px-6 lg:py-6 md:bg-gray-900 md:shadow-xl md:rounded-lg"
    >
      <div class="mt-0 lg:-mt-2 xl:mt-0">
        <h1 class="hidden text-white text-md lg:text-3xl md:block">
          <span class="inline font-thin">Sök</span>
          <span class="inline font-bold">Kontrollansvariga</span>
        </h1>
        <form @submit.prevent="handleSearch">
          <div
            class="flex items-center w-full px-3 py-2 mx-auto mt-2 bg-white rounded shadow md:mt-4"
          >
            <i v-if="hasSearchValue" @click="resetSearch" class="mr-3 fas fa-times-circle"></i>
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
              class="w-16 px-2 py-2 text-xs font-bold text-white no-underline uppercase bg-blue-600 rounded shadow-md hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
            >Sök</button>
          </div>
        </form>
      </div>
      <div class="hidden pt-8 pb-4 lg:block company-list-width" id="width-of-sidebar">
        <h2 class="inline text-2xl font-bold text-white">Hela Sverige</h2>
        <p class="inline ml-2 text-lg text-gray-500">123 results</p>
      </div>
      <div class="hidden lg:block">
        <loading-progress :active="loading" />
      </div>
      <div
        v-if="companies.length"
        class="hidden overflow-y-scroll companylist lg:block"
      >
        <div
          v-for="company in companies"
          :key="company.company_id"
          class="p-2 mb-6 text-blue-900 bg-white rounded shadow-lg hover:bg-blue-400 animate-company"
          :class="{ 'bg-blue-400': company == currentCompany }"
          @click="handleClick(company)"
        >
          <div class="flex items-center p-1">
            <div
              class="flex items-center justify-center w-12 h-12 mr-4 text-sm font-bold text-white bg-red-400 rounded-full xl:h-16 xl:w-16 xl:text-base"
            >Logo</div>
            <div class="w-3/4">
              <p class="text-base font-semibold">{{ company.name }}</p>
              <p class="font-sans text-sm font-light">{{ company.address }}</p>
            </div>
          </div>
          <div v-if="company == currentCompany" class="justify-center">
            <button
              @click="readMore"
              class="w-full py-2 text-sm font-semibold text-white no-underline bg-blue-700 rounded shadow-md xxl:text-base hover:text-white hover:bg-blue-500 focus:outline-none active:shadow-none"
            >Läs mer</button>
          </div>
        </div>
      </div>
      <div v-else class="w-2/3 mx-auto overflow-auto text-center companylist">
        <div v-if="searchValue" class="mt-4">
          <span
            class="text-base text-gray-900 xl:text-lg"
          >Inga resultat, prova att söka på någonting annat!</span>
          <div class="w-2/3 mx-auto mt-8 xl:w-1/2">
            <img v-bind:src="require('images/company_empty.svg')" />
          </div>
        </div>
        <span v-if="loading" class="text-white">Laddar in företag.</span>
      </div>
    </div>
    <company-info :show="shouldExpand" @close="closeInfo" :company="currentCompany"></company-info>
  </div>
</template>

<script>
export default {
  name: "CompanyList",
  props: ["companies", "currentCompany", "initialSearch", "loading"],
  data: () => ({
    searchValue: "",
    expanded: false
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

<style scoped>
.slide-enter-active,
.slide-leave-active {
  transition: 0.5s;
}

.slide-enter {
  transform: translate(-100%, 0);
}

.slide-leave-to {
  transform: translate(-100%, 0);
}

.animate-company {
  transition: all 0.1s ease-in-out;
}

.animate-company:hover {
  padding-left: -12px;
  transition: all 0.1s ease-in-out;
}
</style>
