should = require "should"
Users = require "../src/controllers/users"

{connect} = require "./helpers"

connect()

describe "Users Controller", ->
	users = null
	removeUsers = (done) ->
		users.Model.remove { id: "111" }, (err, affected) ->
			throw err if err

			done()

	beforeEach (done) ->
		users = new Users
		removeUsers done

	testUserOpts =
		id: "111"
		displayName: "Test User"
		token: "Token"
		tokenExpire: new Date().getTime() + 30000

	it "can create a user", (done) ->
		users.create testUserOpts, (err, user) ->
			throw err if err

			should.exist user

			user.id.should.equal testUserOpts.id
			user.displayName.should.equal testUserOpts.displayName

			done()

	it "can find a user", (done) ->
		users.create testUserOpts, (err, user) ->
			throw err if err

			should.exist user

			users.findOne { id: testUserOpts.id }, (err, found) ->
				throw err if err

				should.exist found

				found.id.should.equal testUserOpts.id
				found.displayName.should.equal testUserOpts.displayName

				done()

	it "can find or create a user", (done) ->
		users.findOrCreate testUserOpts, (err, user) ->
			throw err if err

			should.exist user

			done()