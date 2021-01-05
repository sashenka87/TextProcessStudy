export default {
  namespaced: true,
  state: {
    pane: 0
  },
  mutations: {
    updatePane(state, payload) {
      state.pane = payload
    }
  },
  actions: {
    clickStage(context, payload) {
      context.commit('updatePane', payload)
    },
    nextPane(context) {
      const currentPane = context.state.pane
      context.commit('updatePane', currentPane + 1)
    }
  },
  getters: {
  },
}
