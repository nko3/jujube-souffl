auth = require "./auth"
apiRoutes = require "./apiRoutes"

init = (app) ->
	# All the routes should go in here.

	# Pages that don't need authentication
	app.get ['/', '/about'], (req, resp) -> 
	  resp.render 'index'

	# Pages that require authentication
	app.get ['/shows', '/show', '/user'], (req, resp) ->
	  return resp.redirect "/" unless req.user

	  resp.render "index"

	# Register the api related routes
	apiRoutes.init app

	# Authentication related routes
	auth.registerRoutes app

module.exports = { init }