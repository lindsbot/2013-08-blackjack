class window.CardView extends Backbone.View
  tagname: 'span'
  template: _.template '<%= rank %> of <%= suit %>'
  render: ->
    @$el.html(@template(@model.attributes));