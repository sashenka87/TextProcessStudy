<template>
  <li class="steps-segment has-gaps" :class="{'is-active': active }">
    <a @click="updatePane(step)" class="steps-marker"></a>
    <div class="steps-content">
      <p @click="updatePane(step)" class="heading">
        <slot></slot>
      </p>
    </div>
  </li>
</template>
<script>
export default {
  props: ['step'],
  methods: {
    updatePane(index) {
      this.$store.dispatch('tutorial/clickStage', parseInt(index))
    }
  },
  computed: {
    active() {
      return this.$store.state.tutorial.pane == this.step
    },
  }
}
</script>
<style scoped>
.steps-content .heading {
  cursor: pointer;
}
</style>
