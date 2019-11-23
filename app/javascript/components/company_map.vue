<template>
  <div class="w-full flex h-full absolute">
    <div class="w-full flex">
      <div class="w-1/4 max-w-lg hidden xl:flex py-4 bg-gray-900">
        <company-list
          :companies="companies"
          :currentCompany="currentCompany"
          @select="selectCompany"
        ></company-list>
      </div>
      <div class="w-full xl:w-3/4 xxl:w-4/5 relative">
        <div class="flex flex-wrap lg:p-0 xl:px-10 xl:py-8 h-screen lg:h-full">
          <div
            class="w-full lg:w-2/3 xxl:w-3/4 relative bg-white mapheight lg:h-full"
          >
            <mapbox
              :accessToken="accessToken"
              :companies="companies"
              @select="selectCompany"
            ></mapbox>
          </div>
          <company-sidebar :company="currentCompany"></company-sidebar>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyMap",
  props: ["accessToken", "authenticity"],
  data: () => ({
    companies: () => [],
    currentCompany: () => {},
  }),
  mounted() {
    this.fetchCompanies();
  },
  methods: {
    fetchCompanies() {
      this.loading = true;
      this.$http({
        method: "POST",
        url: "/search/company.json",
        headers: {
            'X-CSRF-Token': this.authenticity,
        },
        data: {
        }
      })
        .then(result => {
          this.companies = result.data;
          this.currentCompany = this.companies[0];
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
