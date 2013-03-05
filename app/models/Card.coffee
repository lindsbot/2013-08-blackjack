class window.Card extends Backbone.Model

  initialize: (params) ->
    @set 'suitName', ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
    @set 'rankName', switch params.rank
      when 0 then "King"
      when 1 then "Ace"
      when 11 then "Jack"
      when 12 then "Queen"
      else params.rank
    @set 'value', !params.rank or 10 < params.rank ? 10 : params.rank
