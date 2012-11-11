define [
  'chaplin',
  'models/base'
], (Chaplin, BaseModel) ->
  'use strict'

  class ShowsModel extends BaseModel

    defaults:
      message: 'Hello World! Shows'

      shows: []

    #initialize: (attributes, options) ->
      #super
      #console.debug 'HelloWorld-Shows#initialize'