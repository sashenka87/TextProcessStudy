<template>
  <div class="has-text-right">
    <button class="button is-success" @click="nextPane">Next &rarr;</button>
  </div>
</template>
<script>
export default {
  methods: {
    nextPane() {
      this.$store.dispatch('tutorial/nextPane')
    }
  }
}
</script>
