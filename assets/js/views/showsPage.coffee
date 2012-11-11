define [
  'views/base'
  'views/showsCollection'
  'models/show'
  'text!/templates/showsPage.hbs'
  'bootstrap_datepicker'
  'bootstrap_timepicker'
], (Views, ShowsCollectionView, ShowModel, template) ->
  'use strict'

  class ShowsView extends Views.PageView

    events: {
      "click #showCreateForm": "showCreateForm"
      "click #cancelCreate": "cancelCreate"
      "click #saveShow": "saveShow"
    }

    constructor: (props) ->
      super props, "showsPage", template

    cancelCreate: (ev) ->
      ev.preventDefault()
      $("#show-modal").modal("hide")

    showCreateForm: (ev) ->
      ev.preventDefault()

      $("#startDate").datepicker()
      $("#startTime").timepicker()

      # The modal is shown by default because of the data- attributes, but we should move that here eventually
      $("#show-modal").modal("show")

    saveShow: (ev) ->
      ev.preventDefault();

      # Disable the button
      $(ev.currentTarget).attr("disabled", "disabled")

      # Build up the new model
      newShow = new ShowModel
        name: @$("#inputShowName").val()
        startDate: @$("#inputStartDate").val()
        startTime: @$("#startTime").val()
        durationMin: @$("#inputDurationMin").val()

      # TODO: Validate the model

      # Save the model with success / error callbacks.
      newShow.save null, 
        success: =>
          $(ev.currentTarget).removeAttr("disabled")
          # Dismiss the modal
          $("#show-modal").modal("hide")
          # Refetch the shows
          # TODO: Publish something that the shows view subscribes to
          (@subview "Shows").collection.fetch()

        error: ->
          $(ev.currentTarget).removeAttr("disabled")
          alert("Sorry, there was a problem saving your new show")


    afterRender: ->
      super
      @subview "Shows", new ShowsCollectionView()