class window.BlackjackView extends Backbone.View
  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"
  playerHand: '.player-cards'
  dealerHand: '.dealer-cards'
  initialize: ->
    @deck = new Deck
    @getDealerHand()
    @getPlayerHand()
  reset: ->
    $(@playerHand).html('')
    $(@dealerHand).html('')
    @initialize()

  hit: ->
    card = new CardView model: @deck.pop()
    $(@playerHand).append card.render()

  getPlayerHand: ->
    card = new CardView model: @deck.pop()
    $(@playerHand).append card.render()
    card2 = new CardView model: @deck.pop()
    $(@playerHand).append card2.render()

  getDealerHand: ->
    @coveredCard = new CardView model: @deck.pop()
    $(@dealerHand).append @coveredCard.obfuscate()

    card2 = new CardView model: @deck.pop()
    $(@dealerHand).append card2.render()
  stand: ->
    $('.obfuscate').removeClass().html @coveredCard.render()