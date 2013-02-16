class window.Card extends Backbone.Model

  initialize: (data) ->
    this.rank = data.rank
    this.suit = data.suit

class window.Hand extends Backbone.Collection
  model: Card,

class window.Deck extends Backbone.Collection

  initialize: () ->
    @deck = _.range(1, 53);
    _.shuffle(@deck)
    #take the array of 1-52, convert it into rank and suit
    @deck.each (card) ->
      rank = card % 13
      suit = card % 4
      this.collection.add(new Card({rank:rank, suit:suit}))
  draw: #TODO pop