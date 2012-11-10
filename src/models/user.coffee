goose = require "./goose"

User = goose.MakeModelWith "User", 
    id: String
    displayName: String
    token: String
    tokenExpire: String

module.exports = User