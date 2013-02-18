class window.BlackjackView extends Backbone.View

  #todo: move some of this into the game view and make a corresponding game model

  events:
    "click .hit-button": -> @playerHand.hit()
    "click .stand-button": -> @dealerHand.play()
    "click .reset-button": -> throw new Error 'arg! not implemented yet'

  initialize: ->
    @playerHandView = new HandView collection: @model.playerHand
    @model.playerHand.on 'change', => @render
    @dealerHandView = new HandView collection: @model.dealerHand
    @model.dealerHand.on 'change', => @render
    @render()

  render: ->
    @$el.children.detach()
    @$el.html @template @model.attributes
    @$('.whereverthefuckthosethingsgo').html @playerHandView.render()
    @$('.whereverthefuckthosethingsgo').html @dealerHandView.render()
    @$('.whereverthefuckthosethingsgo').html @dealerHandView.render()
