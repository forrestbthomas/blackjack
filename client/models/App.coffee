#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', =>
	    dealersHand = @get('dealerHand')
    	if dealersHand.models[0].get('revealed') == false then dealersHand.models[0].flip()
    	if @get('dealerHand').scores().length == 2
    		while (@get('dealerHand').scores()[0] < 16 || @get('dealerHand').scores()[1] < 16)
    		    @get('dealerHand').hit()
    	else
    	    if @get('dealerHand').scores() < 16
    	        @get('dealerHand').hit()
    	        @get('playerHand').stand()
    @get('dealerHand').on 'deal', =>
    	@initialize()
    @get('playerHand').on 'bust', =>
    	alert('BUSTED!!! YOU LOSE!!!')
    @get('dealerHand').on 'bust', =>
    	alert('DEALER BUSTED!!! YOU WIN!!!')






