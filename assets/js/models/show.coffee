define [
	'models/base'
], (BaseModel) ->

	class ShowModel extends BaseModel
		urlRoot: '/api/show'

		idAttribute: "_id"

		defaults:
			name: ""
			startDate: ""
			startTime: ""
			durationMin: 0