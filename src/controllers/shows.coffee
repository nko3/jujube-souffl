[Show] = require "../models/show"
{FindByUserController} = require "./base"

class ShowController extends FindByUserController
	constructor: ->
		super Show

module.exports = ShowController