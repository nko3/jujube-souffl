
[User] = require "../models/user"
{ModelController} = require "./base"

class UserController extends ModelController
	findOrCreate: (opts, done) ->
		@find opts.id, (err, user) =>
			done err if err

			if user 
				return done null, user

			@create opts, done

module.exports = UserController
