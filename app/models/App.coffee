#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @newGame()

  newGame: =>
    @set 'playerScore', @get('playerHand').scores()
    @set 'dealerScore', @get('dealerHand').scores()

    @get('playerHand').on 'hit', () =>
      @set 'playerScore', @get('playerHand').scores()
      @set 'dealerScore', @get('dealerHand').scores()
      if (@get('playerHand').isBusted() || @get('dealerHand').isBusted()) then @gameOver()

    @get('playerHand').on 'stand', () =>
      @dealerPlay()

    @get('dealerHand').on 'hit', () =>
      @dealerPlay()

  dealerPlay: =>
    if !(@get('dealerHand').models[0].get('revealed')) then @get('dealerHand').models[0].flip()
    @set 'dealerScore', @get('dealerHand').scores()
    if @get('dealerScore') < 17 then @get('dealerHand').hit() else (@get('dealerHand').stand() && @gameOver())


  gameOver: ->
    winString = 'You win!'
    loseSring = 'You lose AND you smell!'
    tieString = 'It\'s a tie!'

    if @get('playerHand').isBusted() then alert loseSring
    else if @get('dealerHand').isBusted() then alert winString
    else
      if @get('dealerScore') > @get('playerScore') then alert loseSring
      else if @get('dealerScore') < @get('playerScore') then alert winString
      else alert tieString
    if @get('deck').length > 10
      (@set 'playerHand', @get('deck').dealPlayer()) && (@set 'dealerHand', @get('deck').dealDealer())
      @trigger 'gameOver'
      @newGame()
    else @initialize()

