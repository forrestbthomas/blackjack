class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="deal-button">Deal</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .deal-button": -> 
      @model.get('dealerHand').deal()
      @render()

  initialize: ->
    @render()

  dealerCss: 
    'float': 'right'

  playerCss:
    'float': 'left'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('body').css('background-image', 'url("img/blackjacktable.jpg")')
    @$('.dealer-hand-container').css(@dealerCss)
    @$('.player-hand-container').css(@playerCss)
