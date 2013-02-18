class window.BlackjackView extends Backbone.View

  #todo: move some of this into the game view and make a corresponding game model

  template: _.template '<h1>Coffeescript Blackjack!</h1>
    <h2>Dealer\'s cards</h2>
    <div class="cards dealer-cards">
    </div>
    <h2>Your cards</h2>
    <div class="cards player-cards">
    </div>
    <h2>Score</h2>
    <p>Dealer: <span class="dealer-score">0</span></p>
    <p>You: <span class="player-score">0</span></p>
    <h2>Things to do</h2>
    <button class="reset-button">Start over</button>
    <button class="hit-button">Hit</button>
    <button class="stand-button">Stand</button>'

  events:
    "click .hit-button": -> @playerHand.hit()
    "click .stand-button": -> @dealerHand.play()
    "click .reset-button": -> throw new Error 'arg! not implemented yet'

  initialize: ->
    @playerHandView = new HandView collection: @model.attributes.playerHand
    @model.attributes.playerHand.on 'change', => @render
    @dealerHandView = new HandView collection: @model.attributes.dealerHand
    @model.attributes.dealerHand.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-cards').append @playerHandView.render()
    @$('.dealer-cards').append @dealerHandView.render()
    @$el
