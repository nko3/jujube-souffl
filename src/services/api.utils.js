var Api = function(hostname, parameters, api) {
		this.hostname = hostname;
		this.api = api;
		this.parameters = parameters;
	};

Api.prototype.hostname = '';
Api.prototype.api = {};
Api.prototype.parameters = {};

var EndPoint = function(api, url, optional) {
		this.api = api;
		this.url = url;
		this.method = 'GET';
		this.optional = optional;
	};

EndPoint.prototype.buildRequest = function(parameters) {
	var path = this.url;
	for(var param in parameters) {
		var value = parameters[param];
		if(path.indexOf(param) !== -1) {
			path = path.replace(param, value);
		}
	}
	return {
		host: this.api.hostname,
		path: path,
		method: this.method
	};
};

exports.Api = Api;
exports.EndPoint = EndPoint;