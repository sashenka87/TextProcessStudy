<template>
  <ul class="steps has-content-centered">
    <progress-button step="0">
    </progress-button>
    <progress-button step="1">
    </progress-button>
    <progress-button step="2">
    </progress-button>
    <progress-button step="3">
    </progress-button>
  </ul>
</template>
<script>
import ProgressButton from './progressButton.vue'

export default {
  components: { ProgressButton }
}
</script>
<style scoped>
</style>
