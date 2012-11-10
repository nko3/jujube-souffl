define [
  'views/base'
  'text!/templates/user.hbs'
], (Views, template) ->
  'use strict'

  class UserView extends Views.TemplateView

    tagName: "aside"
    className: 'user'

    # Automatically append to the DOM on render
    container: '#user-holder'
    containerMethod: 'html'

    # Automatically render after initialize
    autoRender: true

    constructor: (props) ->
      super props, template

    initialize: ->
      @modelBind "change:loggedIn", @render

      @subscribeEvent "login:pivotal", @handlePivotalLogin

    handlePivotalLogin: (userName, token) ->
      @model.set
        loggedIn: true
        displayName: userName

    handlePivotalLogout: ->
      @model.set
        loggedIn: false
        displayName: 'Not Logged In'



