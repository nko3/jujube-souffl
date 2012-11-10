var APIUtils = require('./api.utils'),
	Api = APIUtils.Api,
	EndPoint = APIUtils.EndPoint;

var hostname = 'services.tvrage.com';
var parameters = {
	':showname': typeof(String),
	':showid': typeof(Number),
	':season': typeof(Number),
	':episode': typeof(Number),
	':exact': typeof(Number)
};

var tvrage = new Api(hostname, parameters);
tvrage.api = {
	feed: {
		search: new EndPoint(tvrage, '/feeds/search.php?show=:showname'),
		detailed_search: new EndPoint(tvrage, '/feeds/full_search.php?show=:showname'),
		show_info: new EndPoint(tvrage, '/feeds/showinfo.php?sid=:showid'),
		episode_list: new EndPoint(tvrage, '/feeds/episode_list.php?sid=:showid'),
		episode_info: new EndPoint(tvrage, '/feeds/episodeinfo.php?show=:showname&exact=:exact&ep=:seasonx:episode'),
		show_info_and_episode_list: new EndPoint(tvrage, '/feeds/full_show_info.php?sid=:showid')
	},
	tools: {
		quickinfo: new EndPoint(tvrage, '/tools/quickinfo.php?show=:showname', {
			ep: 'ep=:seasonx:episode',
			exact: 'exact=:exact'
		})
	}
};

exports.tvRageAPI = tvrage;