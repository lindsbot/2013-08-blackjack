class window.Deck extends Backbone.Collection

  # model: Card

  initialize: ->
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card
        rank: card % 13,
        suit: Math.floor(card / 13),
        covered: 'uncovered'

  dealPlayer: -> new Hand [ @pop(), @pop() ]
  dealDealer: ->
    coveredCard = @pop().set 'covered', 'covered'
    new Hand [ coveredCard, @pop()]
  hit: (hand) ->
    hand.add(@pop())