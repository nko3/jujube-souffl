define ->
  'use strict'

  # The routes for the application. This module returns a function.
  # `match` is match method of the Router
  (match) ->

    match '', 'home#show'
    match 'about', "about#show"
    match 'shows', "shows#show"
    match 'watch/:showId', "watch#show"