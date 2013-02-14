###
  You'll probably want to define some kind of Card model.

  If you need to define a collection of cards as well, you could also put that in 
  this file if you want to.
###
class window.Card extends Backbone.Model
###
  draw function--
    when a card is drawn:
      create a card view
        issue random number between 1-52. bind number to card.
        random number / 4
          if random number / 4 === 0-3.25, spade
          if random number / 4 === 3.25-6.5, diamond
          if random number / 4 === 6.5-9.75, club
          if random number / 4 === 9.75-13, heart
          random number % 13 = A-K
        
###