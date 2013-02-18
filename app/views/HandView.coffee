class window.HandView extends Backbone.View

  initialize: -> @collection.on 'change', @render, @

  render: -> @$el.html @collection.map -> new CardView(model: @).render()
