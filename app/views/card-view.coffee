class window.BlackjackView extends Backbone.View
  tagname: 'tr'
  template: _.template '<span>(<%= card %>)</span>'
  render: ->
    @$el.html(@template(@model.attributes))