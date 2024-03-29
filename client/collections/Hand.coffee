class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  bestScore: ->
    scoreOne = 21 - @scores()[0]
    scoreTwo = 21 - @scores()[1]
    return scoreOne if scoreOne < scoreTwo && scoreOne > 0 && scoreTwo != undefined
    scoreTwo 

  hit: ->
    @add(@deck.pop()).last()
    # @bestScore()
    @bust()
  
  bust: ->
    if @scores() > 21 then @trigger 'bust', @

  stand: ->
    @trigger 'stand', @ 

  deal: ->
    @trigger 'deal', @

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]
