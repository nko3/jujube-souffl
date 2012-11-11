Twitter = require "twitter"

config = require "./config"
auth = require "./auth"
{Users, Shows, ShowTweets} = require "./controllers"

users = new Users
shows = new Shows
showTweets = new ShowTweets

makeTweets = (tokenKey, tokenSecret) ->
	new Twitter
		consumer_key: config.twitter.consumerKey
		consumer_secret: config.twitter.consumerSecret
		access_token_key: tokenKey
		access_token_secret: tokenSecret

init = (app) ->

	# List Shows
	app.get "/api/shows", (req, resp) ->
		return resp.send 401 unless req.user

		shows.forUser req.user._id, (err, results) ->
			if err
				return resp.send 500, err.message

			resp.json results

	# Get Show Details
	app.get "/api/show/:showId", (req, resp) ->
		return resp.send 401 unless req.user

		# TODO: Verify user has access to show
		
		shows.findOne { _id: req.param "showId"}, (err, found) ->
			if err
				return resp.send 500, err.message

			resp.json found

	# Create Show
	app.post "/api/show", (req, resp) ->
		return resp.send 401 unless req.user
		
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

	# Edit Show
	app.put "/api/show/:showId", (req, resp) ->
		return resp.send 401 unless req.user

		showId = req.param "showId"

		showDeets = 
			user: req.user._id
			name: req.param "name"
			startDate: req.param "startDate"
			startTime: req.param "startTime"
			durationMin: req.param "durationMin"

		shows.updateSingle showId, showDeets, (err, updated) ->
			if err
				return resp.send 500, err.message

			showDeets._id = showId

			resp.json showDeets

	app.get "/api/tweets/:showId", (req, resp) ->
		console.log "Tweets", req.user
		return resp.send 401 unless req.user

		showId = req.param "showId"

		shows.single showId, (err, show) ->
			console.log "FindShow", err, show
			if err
				return resp.send 500, err.message

			unless show
				return resp.send 404, "Show not found"

			tweets = makeTweets req.user.token, req.user.tokenSecret

			tweets.search show.name, (data) ->
				console.log "TweetSearch: \n", data

				# TODO: Parse out the data

				resp.json data.results


module.exports = {init}