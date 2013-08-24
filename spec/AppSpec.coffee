describe 'app', ->
  testApp = null
  hand1 = null

  beforeEach ->
    testApp = new App()

  describe 'game over', ->
    it "should deal new cards", ->
      # test length of hands
      expect(testApp.get('playerHand').length).toBe 2
      testApp.gameOver()
      expect(testApp.get('playerHand').length).toBe 2
      # test whether cards are the same
      hand1 = testApp.get('playerHand')
      console.log hand1
      testApp.gameOver()
      console.log(testApp.get('playerHand'))
      expect(testApp.get('playerHand') isnt hand1).toBe true
