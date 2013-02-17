class window.CardView extends Backbone.View

  template: _.template '<span class="card"><%= rank %> of <%= suit %></span>'
  obfuscated_card: _.template '<span class="obfuscate"></span>'

  render: ->
    display = {};
    display.rank = switch @model.attributes.rank
      when 0 then "King"
      when 1 then "Ace"
      when 11 then "Jack"
      when 12 then "Queen"
      else @model.attributes.rank
    display.suit = switch @model.attributes.suit
      when 0 then "Spades"
      when 1 then "Diamonds"
      when 2 then "Clubs"
      else "Hearts"
    @template(display);

  obfuscate: ->
    @obfuscated_card();