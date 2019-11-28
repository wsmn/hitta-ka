<template>
  <div class="w-full flex h-full absolute">
    <div class="w-full flex">
      <div class="w-1/4 max-w-lg hidden xl:flex py-4 bg-gray-900">
        <company-list
          :companies="companies"
          :currentCompany="currentCompany"
          :initialSearch="searchValue"
          @select="selectCompany"
          @search="searchCompanies"
        ></company-list>
      </div>
      <div class="w-full xl:w-3/4 xxl:w-4/5 relative">
        <div class="lg:p-0 xl:px-10 xl:py-8">
          <div class="flex flex-wrap inline-block h-screen lg:h-auto">
            <div
              class="w-full lg:w-2/3 xxl:w-3/4 bg-white mapheight lg:h-auto"
            >
              <mapbox
                :accessToken="accessToken"
                :companies="companies"
                :company="currentCompany"
                @select="selectCompany"
              ></mapbox>
            </div>
            <company-sidebar :company="currentCompany"></company-sidebar>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyMap",
  props: ["accessToken", "authenticity", "searchValue"],
  data: () => ({
    companies: () => [],
    currentCompany: () => {},
  }),
  mounted() {
    this.searchCompanies(this.searchValue);
  },
  methods: {
    searchCompanies(searchValue) {
      this.$http({
        method: "POST",
        url: "/search/company.json",
        headers: {
            'X-CSRF-Token': this.authenticity,
        },
        data: {
          search: searchValue,
        }
      })
        .then(result => {
          this.companies = result.data;
          this.currentCompany = null;
        })
        .catch(err => {
          console.log("Failed to fetch companies: ", err);
        });
    },
    selectCompany(companyId) {
      for (let company of this.companies) {
        if (company.id == companyId) {
          this.currentCompany = company;
          return;
        }
      }
      this.currentCompany = null;
    }
  }
};
</script>
