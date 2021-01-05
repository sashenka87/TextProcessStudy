import axios from 'axios'
import Vue from 'vue/dist/vue.esm'

import VueTippy, { TippyComponent } from "vue-tippy";
Vue.use(VueTippy);
Vue.component("tippy", TippyComponent);

// import Foobar from '../components/foobar.vue'
import ReadingContent from '../components/reading/content.vue'
import ReadingKeyword from '../components/reading/keyword.vue'
import TutorialContainer from '../components/tutorial/container.vue'

// Vue.component('foobar', Foobar)
Vue.component('reading-content', ReadingContent)
Vue.component('reading-keyword', ReadingKeyword)
Vue.component('tutorial-container', TutorialContainer)

import { store } from '../store'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)
Vue.config.productionTip = false
Vue.prototype.$http = axios

document.addEventListener('turbolinks:load', () => {
  axios.defaults.headers.common = {
    "Accept": "application/json, text/plain, */*",
    "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
    "X-Requested-With": "XMLHttpRequest"
  }

  var container = document.querySelector('[vue-enabled]')
  if (container != null) {
    const app = new Vue({
      store
    }).$mount(container)
  }
})
