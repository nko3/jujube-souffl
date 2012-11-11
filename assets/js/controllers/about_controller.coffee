define [
  'controllers/base'
  'models/about'
  'views/about'
], (Bases, About, AboutView) ->
  'use strict'

  class AboutController extends Bases.BaseController

    title: 'About'

    historyURL: (params) ->
      ''

    show: (params) ->
      @model = new About()
      @view = new AboutView model: @model      