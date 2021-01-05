import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

import readingModule from './reading.js'
import tutorialModule from './tutorial.js'

Vue.use(Vuex)

let store = new Vuex.Store({
  modules: {
    reading: readingModule,
    tutorial: tutorialModule
  },
  state: {
  },
  mutations: {
  },
  getters: {
  }
})

store.$http = axios;

export { store };
