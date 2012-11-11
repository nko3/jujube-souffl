define [
  'chaplin',
  'models/base'
], (Chaplin, BaseModel) ->
  'use strict'

  class NavigationModel extends BaseModel

    defaults:
      tabs: [
        { url: "/", title: "Home", 'class': 'home' }
        { url: "/about", title: "About", 'class': 'about' }
        { url: "/shows", title: "DTweetR", 'class': 'shows' }
      ]

    #initialize: (attributes, options) ->
      #super
      #console.debug 'HelloWorld#initialize'