class Blackjack extends Backbone.Model

  initialize: ->
    @set 'deck', new Deck
    @set 'playerHand', @deck.deal()
    @set 'dealerHand', @deck.deal()
