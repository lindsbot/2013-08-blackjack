class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    #TODO: why doesn't 'add' trigger 'change'?
    @collection.on 'change', => @render
    @collection.on 'add', => @render
    @render()

  render: ->
    @$el.children().detach
    @$el.html(@template @collection).append @collection.map (card) -> new CardView(model: card).el
    @$('.score').text @collection.scores()[0]
