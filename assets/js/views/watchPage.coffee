define [
	'chaplin'
	'models/base'
	'models/baseCollection'
	'views/base'
	'models/show'
	'text!/templates/showTweetItem.hbs'
	'text!/templates/showTweetCollection.hbs'
	'text!/templates/watchPage.hbs'
], (Chaplin, BaseModel, BaseCollection, Views, ShowModel, tweetItemTemplate, tweetCollection) ->

	# In a hurry, so holds all the models and views for this page.

	class ShowTweetModel extends BaseModel
		defaults:
			time: 0
			user: ""
			userImg: ""
			message: ""

	class ShowTweetItem extends Views.TemplateView

	class ShowTweetCollection extends BaseCollection

	class WatchPage extends Views.PageView
