class window.Blackjack extends Backbone.Model

  initialize: ->
    @set 'deck', new Deck
    #should I be accessing the attributes directly?
    @set 'playerHand', @attributes.deck.dealPlayer()
    @set 'dealerHand', @attributes.deck.dealDealer()