[ShowTweet] = require "../models/showTweet"
{FindByUserController} = require "./base"

class ShowTweetController extends FindByUserController
	constructor: ->
		super ShowTweet

	forShow: (showId, done) ->
		@Model.find { show: showId }, done

module.exports = ShowTweetController