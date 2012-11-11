goose = require "./goose"

Show = goose.MakeModelWith "Show", 
	user: { type: goose.ObjectId, ref: "User" }
	name: String
	startDate: String
	startTime: String
	durationMin: Number

module.exports = Show