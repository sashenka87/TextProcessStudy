<template>
  <div class="box content">
    <h3 class="is-size-5 has-text-weight-semibold">
      Highlight and comment on any <u>important information</u> you read
    </h3>

    <p>
      As you read, please highlight any <b>important information</b> in texts.
    </p>

    <p>
      You will have two highlighter colors available.
      You can highlight by selecting any portion of text and clicking the green or yellow highlighters.
       </p>
          <p>
      You will also be able to add <b>comments</b> to explain any important information you highlighted.
       </p>
       <br>
<img src="https://photos.app.goo.gl/i1bLHyJ86rSh8s4K9" width="1000">
 
    <br>
    <br>
    <br>
    <next-pane></next-pane>
  </div>
</template>
<script>
import NextPane from '../nextButton.vue'
export default {
  components: { NextPane }
}
</script>
