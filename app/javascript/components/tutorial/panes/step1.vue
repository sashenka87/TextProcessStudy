<template>
  <div class="box content">
    <h3 class="is-size-5 has-text-weight-semibold">
      Interface Training I
    </h3>

    <p>
      As you read, you will be able to highlight and make comments about any <b>important information</b> you see.
    </p>

    <p>
      You will have two highlighter colors available.
      You can highlight by selecting any portion text and clicking the green or yellow highlighter.
    </p>

    <next-pane></next-pane>
  </div>
</template>
<script>
import NextPane from '../nextButton.vue'
export default {
  components: { NextPane }
}
</script>
