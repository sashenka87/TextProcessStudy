<template>
  <div class="tutorial-pane column is-8-desktop is-offset-2-desktop" v-if="visible">
    <slot></slot>
  </div>
</template>
<script>
export default {
  props: ['index'],
  computed: {
    visible() {
      return this.$store.state.tutorial.pane == this.index
    }
  }
}
</script>
