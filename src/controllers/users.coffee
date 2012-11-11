
[User] = require "../models/user"
{ModelController} = require "./base"

class UserController extends ModelController
	constructor: ->
		super User

	findOrCreate: (opts, done) ->
		console.log "findOrCreate", opts
		@findOne { id: opts.id }, (err, user) =>
			done err if err

			console.log "findOne", err, user

			if user 
				return done null, user

			@create opts, (err, user) ->
				console.log "create", err, user

				done err, user

module.exports = UserController
