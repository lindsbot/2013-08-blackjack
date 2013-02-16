describe 'BlackjackView', ->
  view = new BlackjackView
  topCardInDeck = view.model.deck[view.model.deck.length-1]
  firstCardDrawn = view.hit()
  newTop = view.model.deck[view.model.deck.length-1]
  secondCardDrawn = view.hit()
  describe 'initialize', ->
    it "should call the reset function and return a deck", ->
      expect(view.model.deck.length).toBe 50

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(topCardInDeck).toEqual firstCardDrawn
    it "should give the second to last card from the deck on hit 2", ->
      expect(newTop).toEqual secondCardDrawn