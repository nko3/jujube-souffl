express = require 'express'
stylus = require 'stylus'
assets = require 'connect-assets'
jsPathify = require 'connect-assets-jspaths'
mongoose = require "mongoose"

config = require "./config"
auth = require "./auth"

app = express()
# Add Connect Assets
app.use assets()
# Set the public directory as static
app.use express.static(process.cwd() + "/public")
# Set View Engine
app.set 'view engine', 'jade'

# set up our authentication
auth.init app

jsPathify assets, console.log

# All routes return layout.  (Chaplin loads views dynamically)
app.get ['/', '/about'], (req, resp) -> 
  resp.render 'index'

connect = (dbUrl = config.dbServer) ->
    state = mongoose?.connection?.db?._state
    if !state or (state not in ["connected", "connecting"])
        mongoose.connect dbUrl

connect()

# Define Port
port = process.env.PORT or process.env.VMC_APP_PORT or 3000
# Start Server
app.listen port, -> console.log "Listening on #{port}\nPress CTRL-C to stop server."