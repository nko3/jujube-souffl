define [
  'chaplin',
  'models/base'
], (Chaplin, BaseModel) ->
  'use strict'

  class ShowsPageModel extends BaseModel

  	initialize: (props) ->
  		super

  		now = new Date()
  		@set { today: "#{now.getFullYear()}-#{now.getMonth()+1}-#{now.getDate()}" }

  		
    