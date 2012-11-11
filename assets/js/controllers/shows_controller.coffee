define [
  'chaplin'
  'models/shows'
  'views/shows'
], ($, Chaplin, Shows, ShowsView) ->
  'use strict'

  class ShowsController extends Chaplin.Controller

    title: 'Twitter DVR - Shows'

    historyURL: (params) ->
      '/shows'

    show: (params) ->
      console.debug 'ShowsController#show'
      @model = new Shows()
      @view = new ShowsView {@model}

$( ->
  $('#startDate').datepicker()
  $('#startTime').timepicker()
  return
  ) 