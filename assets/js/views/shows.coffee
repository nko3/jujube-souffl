define [
  'views/base'
  'text!/templates/shows.hbs'
  'bootstrap_datepicker'
  'bootstrap_timepicker'
], (Views, template) ->
  'use strict'

  class ShowsView extends Views.PageView

    constructor: (props) ->
      super props, "showsPage", template

    afterRender: ->
      @$("#startDate").datepicker()
      @$("#startTime").timepicker()