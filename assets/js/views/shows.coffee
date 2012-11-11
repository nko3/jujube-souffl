define [
  'views/base'
  'text!/templates/shows.hbs'
  'bootstrap_datepicker'
  'bootstrap_timepicker'
], (Views, template) ->
  'use strict'

  class ShowsView extends Views.PageView

    events: {
      "click #showModalBtn": "showModal"
    }

    constructor: (props) ->
      super props, "showsPage", template

    showModal: ->
      @$("#startDate").datepicker()
      @$("#startTime").timepicker()

      # The modal is shown by default because of the data- attributes, but we should move that here eventually

    afterRender: ->
      super

      