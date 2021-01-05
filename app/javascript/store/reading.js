export default {
  namespaced: true,
  state: {
    comments: [],
    order: -1,
    startTime: null,
    textId: null,
  },
  mutations: {
    addComment(state, payload) {
      state.comments.push({
        text: payload.text,
        timestamp: new Date()
      })
    },
    resetComments(state) {
      state.comments = [];
    },
    setOrder(state, payload) {
      state.order = payload
    },
    setText(state, payload) {
      state.startTime = new Date();
      state.textId = payload;
    }
  },
  actions: {
    captureAction(context, payload) {
      context.commit('setOrder', context.state.order + 1)

      if (payload.comment && payload.comment.length > 0) {
        context.commit('addComment', {
          text: payload.comment
        })
      }

      this.$http.post('/activities', {
        activity: {
          action_type: payload.actionType,
          action_string: payload.actionString,
          comment: payload.comment,
          time_since_tooltip_open: payload.timeSinceTooltipOpen,

          order: context.state.order,
          text_id: context.state.textId,
          time_since_page_load: (new Date() - context.state.startTime),
        }
      })
    },
    initialize(context, payload) {
      context.commit('setOrder', 0)
      context.commit('setText', payload.textId);
      context.commit('resetComments');
    }
  },
  getters: {
  },
}
