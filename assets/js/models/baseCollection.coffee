define [
  'chaplin'
], (Chaplin) ->

  class BaseCollection extends Chaplin.Collection
    
    initialize: (props) ->
        super

        @initSyncMachine()

    fetch: ->
        @beginSync()
        super 
            success: =>
                @finishSync()
            error: =>
                @abortSync()