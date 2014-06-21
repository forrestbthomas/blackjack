#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', =>
    	while @get('dealerHand').scores() < 16 
    		@get('dealerHand').hit()
    @get('dealerHand').on 'deal', =>
    	@initialize()





