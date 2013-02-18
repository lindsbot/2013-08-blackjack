class window.HandView extends Backbone.View

  initialize: -> 
    @collection.on 'change', @render, @
    @collection.on 'add', @render, @
    @render()
  render: -> 
    @$el.html @collection.map (card) -> new CardView(model: card).el
