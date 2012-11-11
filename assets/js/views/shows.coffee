define [
  'views/base'
  'text!/templates/shows.hbs'
], (Views, template) ->
  'use strict'

  class ShowsView extends Views.PageView

    constructor: (props) ->
      super props, "showsPage", template