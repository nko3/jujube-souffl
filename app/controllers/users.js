// Generated by CoffeeScript 1.3.3
var ModelController, User, UserController,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

User = require("../models/user")[0];

ModelController = require("./base").ModelController;

UserController = (function(_super) {

  __extends(UserController, _super);

  function UserController() {
    return UserController.__super__.constructor.apply(this, arguments);
  }

  UserController.prototype.findOrCreate = function(opts, done) {
    var _this = this;
    return this.find(opts.id, function(err, user) {
      if (err) {
        done(err);
      }
      if (user) {
        return done(null, user);
      }
      return _this.create(opts, done);
    });
  };

  return UserController;

})(ModelController);

module.exports = UserController;