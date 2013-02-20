class window.Hand extends Backbone.Collection

  # model: Card
  scores: ->
    #The scores are an array of potential scores.
    #Usually, that array contains one element. That is the only score.
    #when there is an ace, it offers you two scores- the original score, and score + 10.
    hasAce = @filter (card) -> card.value is Card.ACE #This is a better than 'card.suitname === 'ace' because you generally don't want to think in terms of strings.
    score = @reduce (score, card) -> score + card.value()
    if hasAce then [score, score + 10] else [score]

#add hit here, take it out of the deck model:

# hit: -> @add @get('deck').pop()
