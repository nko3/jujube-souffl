define [
  'chaplin'
  'models/baseCollection'
  'views/base'
  'models/show'
  'text!/templates/showsItem.hbs'
  'text!/templates/showsCollection.hbs'
], (Chaplin, BaseCollection, Views, ShowModel, itemTemplate, collectionTemplate) ->

  class ShowsCollection extends BaseCollection
    model: ShowModel

    url: '/api/shows'

  class ShowItemView extends Views.TemplateView
    tagName: "li"
    className: "showItem"

    constructor: (props) ->
      super props, itemTemplate

  class ShowsCollectionView extends Views.TemplateCollectionView

    autoRender: false
    container: "#showsCollection"
    containerMethod: "html"

    listSelector: "#showsList"
    fallbackSelector: "#showsListEmpty"
    loadingSelector: "#showsListLoading"

    itemView: ShowItemView

    constructor: (props) ->
      props ||= {}
      props.collection ||= new ShowsCollection
      super props, collectionTemplate

    initialize: (props) ->
      super

      # TODO: control by passed in property?
      @collection.fetch()
