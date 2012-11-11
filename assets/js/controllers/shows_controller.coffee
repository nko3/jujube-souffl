define [
  'controllers/base'
  'models/shows'
  'views/shows'
], (Bases, Shows, ShowsView) ->
  'use strict'

  class ShowsController extends Bases.AuthController

    title: 'Shows'

    historyURL: (params) ->
      '/shows'

    show: (params) ->
      super
      @model = new Shows()
      @view = new ShowsView {@model}