class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<span class="...covered logic..."><%= rank %> of <%= suit %></span>'

  initialize: -> @model.on 'change', @render, @

  render: ->
    @$el.children.detach()
    @$el.html @template @model.attributes
