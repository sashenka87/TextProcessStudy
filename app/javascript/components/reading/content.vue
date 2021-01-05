<template>
  <div class="reading-content">
    <slot></slot>

    <div class="highlight-button" v-show="highlights">
      <div class="buttons">
        <reading-highlight color="yellow"></reading-highlight>
        <reading-highlight color="green"></reading-highlight>
      </div>

      <div class="comment-feed mt-3" ref="comments">
        <!-- Show the comments -->
        <div class="message is-info" v-for="comment in comments" :key="comment.timestamp.toISOString()">
          <div class="message-body">
            {{ comment.text }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import ReadingHighlight from './highlight.vue'


export default {
  props: ['textId', 'highlights'],
  components: { ReadingHighlight },
  watch: {
    comments() {
      this.$nextTick(() => {
        let height = this.$refs.comments.scrollHeight;
        this.$refs.comments.scroll(0, height);
      })
    }
  },
  computed: {
    comments() {
      return this.$store.state.reading.comments;
    }
  },
  mounted() {
    this.$store.dispatch('reading/initialize', {
      textId: this.textId
    });
  }
}
</script>
<style>
.highlight-button {
  position: fixed;
  left: calc(70vw + 50px);
  top: 30vh;
  width: calc(30vw - 100px);
}

.comment-feed {
  max-height: 50vh;
  overflow-y: scroll;
}
</style>
