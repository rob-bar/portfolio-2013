(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['module', 'backbone', 'helper'], function(module, Backbone, helper) {
    var Repo, _ref;
    Repo = (function(_super) {
      __extends(Repo, _super);

      function Repo() {
        _ref = Repo.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Repo.prototype.attributes = {};

      Repo.prototype.events = {};

      Repo.prototype.initialize = function() {};

      Repo.prototype.render = function() {};

      return Repo;

    })(Backbone.View);
    return module.exports = Repo;
  });

}).call(this);
