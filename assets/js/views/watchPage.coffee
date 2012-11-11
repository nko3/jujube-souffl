define [
    'chaplin'
    'models/base'
    'models/baseCollection'
    'views/base'
    'models/show'
    'text!/templates/showTweetItem.hbs'
    'text!/templates/showTweetCollection.hbs'
    'text!/templates/watchPage.hbs'
], (Chaplin, BaseModel, BaseCollection, Views, ShowModel, tweetItemTemplate, tweetCollectionTemplate, pageTemplate) ->

    # In a hurry, so holds all the models and views for this page.

    class ShowTweetModel extends BaseModel
        defaults:
            time: 0
            author: ""
            authorImg: ""
            message: ""

    class ShowTweetItemView extends Views.TemplateView

        constructor: (props) ->
            super props, tweetItemTemplate

    class ShowTweetCollection extends BaseCollection
        model: ShowTweetModel

        showId: null

        constructor: (props) ->
            @showId = props.showId
            super

        url: ->
            throw new Error("Must set showId for tweet collection") unless @showId

            "/api/tweets/#{@showId}"


    class ShowTweetCollectionView extends Views.TemplateCollectionView
        autoRender: false
        container: "#showTweetsCollection"
        containerMethod: "html"

        listSelector: "#tweetsList"
        fallbackSelector: "#tweetsListEmpty"
        loadingSelector: "#tweetsListLoading"

        itemView: ShowTweetItemView

        constructor: (props) ->
          props ||= {}
          props.collection ||= new ShowTweetCollection { showId: props.showId }

          super props, tweetCollectionTemplate

        initialize: (props) ->
          super

          # TODO: control by passed in property?
          @collection.fetch()

    class WatchPage extends Views.PageView

        constructor: (props) ->
            @showId = props.showId
            
            @model = new ShowModel { _id: @showId }
            @modelBind "change", @render
            @model.fetch()

            super props, 'watchPage', pageTemplate

        afterRender: ->
            super
            @subview "Tweets", new ShowTweetCollectionView { @showId }
