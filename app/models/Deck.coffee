class window.Deck extends Backbone.Collection

  #todo: this shouldn't break it-- but it did
  # model: Card

  initialize: ->
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card
        rank: card % 13,
        suit: Math.floor(card / 13),
        covered: 'uncovered'

  #this is a very simple way to get everything you want.
  dealPlayer: -> new Hand [ @pop(), @pop() ], @

  dealDealer: ->
    coveredCard = @pop().set 'covered', 'covered'
    new Hand [coveredCard, @pop()], @
