auth = require "./auth"

init = (app) ->
	# All the routes should go in here.

	# Pages that don't need authentication
	app.get ['/', '/about'], (req, resp) -> 
	  resp.render 'index'

	# Pages that require authentication
	app.get ['/shows', '/show', '/user'], (req, resp) ->
	  return resp.redirect "/" unless req.user

	  resp.render "index"

	# Authentication related routes
	auth.registerRoutes app

module.exports = { init }