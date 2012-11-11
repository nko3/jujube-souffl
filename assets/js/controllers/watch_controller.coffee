define [
  'controllers/base'
  'views/watchPage'
], (Bases, WatchPageView) ->
  'use strict'

  class ShowsController extends Bases.AuthController

    title: 'Watch'

    historyURL: (params) ->
      '/watch/#{params.showId}'

    show: (params) ->
      super
      @view = new WatchPageView 
        showId: params.showId