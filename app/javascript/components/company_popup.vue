<template>
  <div v-if="company">
      <h3>{{ company.name }}</h3>
  </div>
</template>

<script>
export default {
  name: "CompanyPopup",
  props: ["company"],
};
</script>
