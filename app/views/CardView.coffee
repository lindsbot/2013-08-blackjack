class window.CardView extends Backbone.View

  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    # @$el.html @template @model.attributes
    imgpath = "img\/" + @model.get('suitName') + "\/" + @model.get('rank') + ".svg"
    @$el.append("<image width='100' height='150' viewBox='0 0 300 450' src='"+imgpath+"'></image>")
    @$el.addClass 'covered' unless @model.get 'revealed'

# rank:  @model.get('rank')
# suit:  @model.get('suit')

# @$el.append(img/suit/rank)