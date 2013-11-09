(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Tweet, _ref;
    Tweet = (function(_super) {
      __extends(Tweet, _super);

      function Tweet() {
        _ref = Tweet.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Tweet.prototype.tagName = "li";

      Tweet.prototype.className = "tweet rect item";

      Tweet.prototype.events = {};

      Tweet.prototype.initialize = function() {};

      Tweet.prototype.render = function() {
        return helper.get_template("tweet")(this.model);
      };

      return Tweet;

    })(Backbone.View);
    return module.exports = Tweet;
  });

}).call(this);