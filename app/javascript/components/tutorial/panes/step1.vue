<template>
  <div class="box content">
    <h3 class="is-size-5 has-text-weight-semibold">
      Highlight and comment on any information that is <u>related or connected across texts</u>
    </h3>

    <p>
      As you read, you will be able to highlight any <b>relations</b> or <b>connections across texts</b>.
    </p>

    <p>
      You will have two highlighter colors available.
      You can highlight by selecting any portion text and clicking the green or yellow highlighter.
       </p>
       <p>
        You will also be able to add <b>comments</b> to explain any relations or connections that you highlighted across texts.
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
