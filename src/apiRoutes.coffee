

auth = require "./auth"
{Users, Shows} = require "./controllers"

users = new Users
shows = new Shows

init = (app) ->

	app.get "/api/shows", auth.authenticate(), (req, resp) ->
		shows.all (err, results) ->
			if err
				return resp.send 500, err.message

			resp.json shows

	app.get "/api/show/:showId", auth.authenticate(), (req, resp) ->
		shows.findOne { _id: req.param "showId"}, (err, found) ->
			if err
				return resp.send 500, err.message

			resp.json found

	app.post "/api/show", auth.authenticate(), (req, resp) ->
		showDeets = 
			user: req.user._id
			name: req.param "name"
			startDate: req.param "startDate"
			startTime: req.param "startTime"
			durationMin: req.param "durationMin"

		shows.create showDeets, (err, created) ->
			if err
				return resp.send 500, err.message

			resp.json created

