<template>
  <div class="box content">
    <h3 class="is-size-5 has-text-weight-semibold">
      Interface Training I
    </h3>

    <p>
      As you read, you will be able to highlight and make comments about any important information you see.
    </p>

    <p>
      You will have two highlighter colors available.
      Please use <b>green</b> to highlight the main idea of each text.
      Please use <b>yellow</b> to highlight any supporting evidence.
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
