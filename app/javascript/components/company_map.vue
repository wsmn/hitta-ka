<template>
  <div class="w-full flex h-full absolute">
    <div class="w-full flex flex-wrap">
      <company-list
        :companies="companies"
        :currentCompany="currentCompany"
        :initialSearch="searchValue"
        :loading="loading"
        @select="selectCompany"
        @search="searchCompanies"
      ></company-list>
      <div class="w-full h-full lg:w-2/3 xl:w-full absolute md:px-10 lg:p-0 bg-gray-900 lg:bg-gray-200">
        <div class="lg:p-0 h-full">
          <div class="flex flex-wrap inline-block h-full xl:h-full">
            <div
              class="w-full xl:w-full min-h-1/2 h-full"
            >
              <mapbox
                :accessToken="accessToken"
                :companies="companies"
                :company="currentCompany"
                :resize="resize"
                @select="selectCompany"
              ></mapbox>
            </div>
          </div>
        </div>
      </div>
      <div class="absolute bottom-0 right-0 m-8">
        <enquiry-list></enquiry-list>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "CompanyMap",
  props: ["accessToken", "authenticity", "searchValue"],
  data: () => ({
    companies: [],
    currentCompany: null,
    loading: false,
    resize: 0,
  }),
  mounted() {
    this.searchCompanies(this.searchValue);
  },
  methods: {
    searchCompanies(searchValue) {
      this.loading = true;
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
        this.loading = false;
        })
        .catch(err => {
          this.loading = false;
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
    },
    sidebarLoaded() {
      this.resize += 1;
    }
  }
};
</script>
