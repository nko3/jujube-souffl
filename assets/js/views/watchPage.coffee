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
            time: null
            timeWords: "?"
            author: ""
            authorImg: ""
            message: ""

    class ShowTweetItemView extends Views.TemplateView
        tagName: "li"
        className: "showTweetItem"

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

        parse: (results) ->
            makeTweetFrom = (r) ->
                createdAt = new Date(r.created_at)
                
                time: createdAt
                author: r.from_user
                authorImg: r.profile_image_url
                message: r.text
                timeWords: createdAt.toDateString()

            parsed = (makeTweetFrom result for result in results)

            return parsed


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
