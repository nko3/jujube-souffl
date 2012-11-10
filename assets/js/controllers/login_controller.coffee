define [
  'chaplin'
  'models/user'
  'views/user'
], (Chaplin, UserModel, UserView) ->
  'use strict'

  ###
    Handles the 
  ###
  class LoginController extends Chaplin.Controller

    mediator: Chaplin.mediator

    initialize: ->
      super

      @registerLoginEvents()
      @createUserView()

    createUserView: ->
      @model = new UserModel
      @view = new UserView {@model}

    registerLoginEvents: ->

      @subscribeEvent "login:pivotal", @pivotalLoggedIn
      @subscribeEvent "logout:pivotal", @pivotalLoggedOut

    pivotalLoggedIn: (username, token) ->
      @mediator.pivotaluser = {username, token}      
      # Load the weeks page
      @mediator.publish '!startupController', 'week', 'show'

    pivotalLoggedOut: ->
      @mediator.pivotaluser = null
      # Load home page.
      @mediator.publish '!startupController', 'home', 'show'  

