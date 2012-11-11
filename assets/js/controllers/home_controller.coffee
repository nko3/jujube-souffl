define [
  'controllers/base'
  'models/home'
  'views/home'
], (Bases, Home, HomeView) ->
  'use strict'

  class HomeController extends Bases.AuthController

    title: 'Twitter Feed with your DVR Shows'

    historyURL: (params) ->
      '/'

    show: (params) ->
      super
      @model = new Home()
      @view = new HomeView {@model}