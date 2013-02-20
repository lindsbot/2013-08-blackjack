class window.Blackjack extends Backbone.Model

  initialize: ->
    
    @set 'deck', new Deck
    #should I be accessing the attributes directly?
    #nope! This should be done with @get:
    #@set 'playerHand', @get('deck').dealPlayer()
    #@set 'dealerHand', @get('deck').dealPlayer()
    @set 'playerHand', @attributes.deck.dealPlayer()
    @set 'dealerHand', @attributes.deck.dealDealer()
    #this could also be refactored so that a blackjack game is beneath the outer blackjack model.
