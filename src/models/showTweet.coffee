goose = require "./goose"

ShowTweet = goose.MakeModelWith "ShowTweet", 
	show: { type: goose.ObjectId, ref: "Show" }
	user: { type: goose.ObjectId, ref: "User" }
	author: String
	authorImg: String
	message: String
	time: Number

module.exports = ShowTweet