class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png"></img>' + 
  '<%= rankName %> of <%= suitName %>'
  

  initialize: ->
    @model.on 'change', => @render
    @render()


  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes

