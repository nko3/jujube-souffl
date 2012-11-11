requirePaths = 
  jquery: "//cdnjs.cloudflare.com/ajax/libs/jquery/1.7.2/jquery.min"
  underscore: "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.3.3/underscore-min"
  backbone: "//cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.2/backbone-min"
  bootstrap: "/js/lib/bootstrap"
  bootstrap_datepicker: "/js/lib/bootstrap_datepicker"
  bootstrap_timepicker: "/js/lib/bootstrap_timepicker"
  text: "/js/lib/text"
  handlebars: "/js/lib/handlebars"
  chaplin: "/js/lib/chaplin"
  moment: "/js/lib/moment"

# Fixes for referencing "production" mode assets with hashes.
if connectAssets
  for own key, value of connectAssets
    # Fix up the lib references
    key = key.slice 4 if key.slice(0, 4) == "lib/"
    requirePaths[key] = value 

require.config 
  paths: requirePaths
  shim:
    jquery:
      exports: "$"
    bootstrap: 
      deps: ["jquery"]
    bootstrap_datepicker:
      deps:["bootstrap"]
    bootstrap_timepicker:
      deps:["bootstrap"]
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"
    
require ['app'], (App) ->
    new App().initialize()