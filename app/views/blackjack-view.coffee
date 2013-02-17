class window.BlackjackView extends Backbone.View

  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"

  initialize: ->
    @deck = new Deck
    @draw '.player'
    @draw '.player'
    @draw '.dealer', true
    @draw '.dealer'

  hit: ->
    @draw '.player'

  reset: ->
    $('.player-cards').html('')
    $('.dealer-cards').html('')
    $('.dealer-score').html('0')
    $('.player-score').html('0')
    @initialize()

  stand: ->
    $('.obfuscate').removeClass().html @sneakyCard.render()
    score = parseInt $('.dealer-score').text()
    score += @sneakyCard.model.attributes.value
    $('.dealer-score').html(score)


  draw: (selector, obfuscate) ->
    card = @deck.pop()
    view = new CardView model: card
    cardValue = card.attributes.value
    score = parseInt $(selector+'-score').text()

    if obfuscate
      $(selector+'-cards').append view.obfuscate()
      @sneakyCard = view
    else
      $(selector+'-cards').append view.render()
      if cardValue instanceof Array || @ace
        @ace = true
        @scoreWith11 = score + cardValue[0]
        console.log(cardValue[0])
        @scoreWith1 = score + cardValue[1]
        score = @scoreWith11 + "or" + @scoreWith1
      else
        score += cardValue
      $(selector+'-score').html(score)
