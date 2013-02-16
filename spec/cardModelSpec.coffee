describe "shuffle function", ->

  it "should create an array with a length of 52", ->
    deck = new Deck
    shuffled = deck.shuffle()
    expect(shuffled.length).toBe(52);