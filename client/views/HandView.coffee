class window.HandView extends Backbone.View

  className: 'hand'

  # todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer</h2><% }else{ %><h2>You(<span class="score"></span>)</h2><% } %>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if @collection.scores()[1] == undefined
      @$('.score').text @collection.scores()[0]
    else  
      @$('.score').text @collection.scores()[1]

