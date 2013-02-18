class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<span class="<%= covered %>"><%= rankName %> of <%= suitName %></span>'

  initialize: -> 
    @model.on 'change', @render, @
    @render()
  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes