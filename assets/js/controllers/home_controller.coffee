define [
  'chaplin'
  'models/home'
  'views/home'
], (Chaplin, Home, HomeView) ->
  'use strict'

  class HomeController extends Chaplin.Controller

    title: 'Tweet DVR'

    historyURL: (params) ->
      '/'

    show: (params) ->
      if APPLICATION_SETTINGS.user
        console.debug 'HomeController#loggedInUser', APPLICATION_SETTINGS
        Chaplin.mediator.publish "login:twitter", APPLICATION_SETTINGS.user.displayName, APPLICATION_SETTINGS.user.token

      console.debug 'HomeController#show'
      @model = new Home()
      @view = new HomeView {@model}