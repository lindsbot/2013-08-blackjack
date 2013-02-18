class window.Hand extends Backbone.Collection

  # model: Card
  scores: ->
    hasAce = @filter (card) -> card.value is Card.ACE
    score = @reduce (score, card) -> score + card.value()
    if hasAce then [score, score + 10] else [score]
