define [
  'views/base'
  'text!/templates/home.hbs'
], (Views, template) ->
  'use strict'

  class HomeView extends Views.PageView
    
    constructor: (props) ->
      super props, "homePage", template

    events:
    	'click .twitter_login_btn' : 'login'

    login: (ev) ->
    	ev.preventDefault()
    	window.location = '/auth/twitter'