define [
  'controllers/base'
  'models/showsPage'
  'views/showsPage'
], (Bases, ShowsPage, ShowsPageView) ->
  'use strict'

  class ShowsController extends Bases.AuthController

    title: 'Shows'

    historyURL: (params) ->
      '/shows'

    show: (params) ->
      super
      @view = new ShowsPageView
