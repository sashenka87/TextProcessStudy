<template>
  <div class="tutorial-container">
    <tutorial-progress></tutorial-progress>

    <div class="tutorial-panes">
      <pane index='0'>
        <step0></step0>
      </pane>
      <pane index='1'>
        <step1></step1>
      </pane>
      <pane index='2'>
        <step2></step2>
      </pane>
      <pane index='3'>
        <step3></step3>
      </pane>
    </div>
  </div>
</template>
<script>
import TutorialProgress from './progress.vue'
import Pane from './panes/index.vue'
import Step0 from './panes/step0.vue'
import Step1 from './panes/step1.vue'
import Step2 from './panes/step2.vue'
import Step3 from './panes/step3.vue'

export default {
  components: {
    TutorialProgress,
    Pane,
    Step0, Step1, Step2, Step3
  },
}
</script>
<style scoped>
  .tutorial-container {
    margin-bottom: 24px;
  }
</style>
