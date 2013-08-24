#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerTurn', true
    @on 'changeTurn', @changeTurn()
    @set 'playerScore', @get('playerHand').scores()
    @set 'dealerScore', @get('dealerHand').scores()
    @on 'hit', () ->
      @set 'playerScore', @get('playerHand').scores()
      @set 'dealerScore', @get('dealerHand').scores()
      if (@get('playerScore').isBusted() || @get('dealerScore').isBusted()) then @gameOver()

    # @on 'change:turn', () ->

  changeTurn: ->
    @set 'playerTurn', !@get 'turn'

  # when player stands do:
  # flip the hidden card
  # score dealer hand
  # if dealer score < 17, hit --> trigger everything after flip again if they hit
  # else stand
  # on dealer stand, GAME OVERRRR


  gameOver: ->
    # if bust, other player wins
    # if no bust, high score wins
    # if tie, dealer wins

