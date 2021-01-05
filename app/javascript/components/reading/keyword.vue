<template>
  <div class="reading-keyword">
    <a @click="click" class='keyword has-text-weight-bold'>
      {{this.text}}
    </a>

    <tippy arrow trigger="manual" ref="tippy"
      @shown="focusOnText" @hidden="finish">
      {{this.definition}}
    </tippy>
  </div>
</template>
<script>
export default {
  props: ['text', 'definition'],
  data() {
    return {
      startTime: null,
    }
  },
  methods: {
    click(event){
      this.$refs.tippy.tip.show();
    },
    focusOnText() {
      this.startTime = new Date()
    },
    finish() {
      const totalTime = new Date() - this.startTime;

      // Dispatch to vuex
      this.$store.dispatch('reading/captureAction', {
        actionType: `keyword`,
        actionString: this.text,
        timeSinceTooltipOpen: totalTime
      })
    }
  }
}
</script>
<style>
.reading-keyword {
  display: inline-block;
}

.keyword {
  /*background-color: "yellow";*/
}
</style>
