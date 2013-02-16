describe "deck constructor", ->

  it "should create a card collection that is poppable", ->
    @collection = new Deck
    console.log @collection.pop()