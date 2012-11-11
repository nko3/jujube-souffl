define [
  'chaplin'
  'views/base'
  'text!/templates/shows.hbs'
  'bootstrap_datepicker'
  'bootstrap_timepicker'
], (Chaplin, Views, template) ->
  'use strict'

  class ShowsView extends Views.PageView

    constructor: (props) ->
      super props, "showsPage", template

  	events:
    	'click #cancelModalBtn' : 'cancelModal'
    	'click #saveBtn' : 'saveShow'

	cancelModal: (ev) ->
    	ev.preventDefault()
    	$('#show-modal').modal('hide')

    saveShow: (ev) ->
    	ev.preventDefault()
    	alert('hi')