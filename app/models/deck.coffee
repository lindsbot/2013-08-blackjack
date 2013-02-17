class window.Card extends Backbone.Model

class window.Deck extends Backbone.Collection

  initialize: ->
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card 
      rank: card % 13,
      suit: Math.floor(card / 13),
      value: switch card % 13
        when 0 then 10
        when 1 then [11, 1]
        when 12 then 10
        when 11 then 10
        else card % 13
