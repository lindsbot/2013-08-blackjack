class window.HandView extends Backbone.View

  initialize: -> 
    @collection.on 'change', @render, @

  render: -> 
    @collection.map (card) -> new CardView(model: card).render()
