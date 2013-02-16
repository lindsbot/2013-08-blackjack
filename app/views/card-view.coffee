class window.CardView extends Backbone.View
  tagname: 'span'
  template: _.template '<%= value %> of <%= suit %>'
  render: ->
    @$el.html(@template(@model.attributes));