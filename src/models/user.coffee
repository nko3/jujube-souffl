goose = require "./goose"

UserSchema = 
	id: String
	displayName: String
	token: String
	tokenSecret: String

User = goose.MakeModelWith "User", UserSchema

module.exports = User