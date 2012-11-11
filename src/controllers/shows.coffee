[Show] = require "../models/show"
{ModelController} = require "./base"

class ShowController extends ModelController
	constructor: ->
		super Show

module.exports = ShowController