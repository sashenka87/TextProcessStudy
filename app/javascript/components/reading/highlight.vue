<template>
  <div class="mr-3">
    <tippy :to="elemName" arrow trigger="click"
      placement="bottom"
      :interactive="true" ref="ttt"
      @show="getTextSelection"
      @shown="focusOnText"
      @hidden="finishHighlight">
      <div v-if="this.textSelection.length == 0">
        Please select text to be highlighted first.
      </div>
      <div v-else>
        <textarea rows="6" width="200px"
          id="highlight-comment" class="textarea mb-1" ref='text'
          placeholder="Please add your comment here"
          v-model="comment" />

        <div class="button-row">
          <button class="button is-small"
            :class="{ 'is-warning': this.color == 'yellow', 'is-success': this.color == 'green' }"
            @click="submitComment">
            Add comment
          </button>
        </div>
      </div>
    </tippy>

    <button :name="elemName" class="button"
      :class="{ 'is-warning': this.color == 'yellow', 'is-success': this.color == 'green' }">
      <i class="fas fa-highlighter"></i>
    </button>
  </div>
</template>
<script>
export default {
  props: ["color"],
  data() {
    return {
      comment: "",
      startTime: null,
      textSelection: ""
    }
  },
  methods: {
    getTextSelection() {
      this.textSelection = document.getSelection().toString()
      this.startTime = new Date();
    },
    focusOnText() {
      if (this.textSelection.length == 0) {
        return
      }

      let highlightColor = '#DDD'
      if (this.color == 'yellow') {
        highlightColor = '#fff957'
      }
      if (this.color == 'green') {
        highlightColor = '#8ee85a'
      }

      document.designMode = "On"
      document.execCommand("hiliteColor", false, highlightColor)
      document.designMode = "Off"

      this.$refs.text.focus()
    },
    finishHighlight() {
      const totalTime = new Date() - this.startTime;

      // Dispatch to vuex
      if (this.textSelection.length > 0) {
        this.$store.dispatch('reading/captureAction', {
          actionType: `highlight - ${this.color}`,
          actionString: this.textSelection,
          comment: this.comment,
          timeSinceTooltipOpen: totalTime
        })
      }

      // Reset for next time
      this.comment = ""
    },
    submitComment(){
      this.$refs.ttt.tip.hide()
      this.$emit('submit')
    }
  },
  computed: {
    elemName() {
      return `highlightTrigger${this.color}`
    }
  }
}
</script>
<style>
</style>
