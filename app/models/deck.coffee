class window.Deck extends Backbone.Collection
  #this shouldn't break it-- but it did
  # model: Card

  initialize: ->
    #shuffle an array of 1-52. For each number, you can derive the rank by being the modulus of that number.
    #If we floor the division by 13, we can get 1-4 suits.
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card
        rank: card % 13,
        suit: Math.floor(card / 13),
        covered: 'uncovered'
  #this is a very simple way to get everything you want.
  dealPlayer: -> new Hand [ @pop(), @pop() ]
  dealDealer: ->
    coveredCard = @pop().set 'covered', 'covered'
    new Hand [ coveredCard, @pop()]
  hit: (hand) ->
    hand.add(@pop())
#good refactor-- take the "hit" method and bring it to the hand, instead of bringing the hand to the deck.
