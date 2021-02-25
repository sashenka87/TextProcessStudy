<template>
  <div class="box content">
    <h3 class="is-size-5 has-text-weight-semibold">
      Highlight and comment on any information that is <u>confusing or difficult</u> for you to understand
    </h3>

    <p>
      As you read, you will be able to highlight any information that is <b>confusing</b> or <b>difficult</b> for you to understand.
    </p>

    <p>
      You will have two highlighter colors available.
      You can highlight by selecting any portion text and clicking the green or yellow highlighter.
       </p>
       <p>
       You will also be able to add <b>comments</b> to explain any information that is confusing or difficult for you to understand.
       </p>
  <br>
<img src="https://i.postimg.cc/vmNRrJ27/Figure-1-Screenshot.png" width="1000">
 
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
