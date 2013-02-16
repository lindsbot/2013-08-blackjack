###
  This is how you define a class in coffeescript. Internally it does what
  Backbone.View.extend does.

  You need to explicitly define your class as a property of the global window
  object, because coffeescript is always executed in an anonymous function scope
  instead of the global scope.

  You can still normally access the class as BlackjackView everywhere, though.
###
class window.BlackjackView extends Backbone.View
  events:
    "click .hit-button": "hit"
    "click .stand-button": "stand"
    "click .reset-button": "reset"

  initialize: ->
    @model = new Deck

    # note: example code: @$el.append(subview.render())

    # do we want a hand view?

    # 2 cards (and subviews) for dealer
    # 2 cards (and subviews) for player
    # @subview = new CardView
    @reset()
    #generate subview, using top of deck, for 2 dealer cards and 2 player cards.
  reset: ->
    @subview.render()
    return @model.shuffle()

  hit: ->
    return @model.deck.pop()

  stand: ->
    alert "TOTO implement stand"