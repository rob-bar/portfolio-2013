define [
  'module'
  'backbone'
  'helper'
  'site'
],
(module, Backbone, helper, site) ->
  class Me extends Backbone.View
    tagName: "div"
    className: "intro"
    attributes:
      id: "me"

    events: {}

    initialize: ->
    render: ->
      $.ajax "/rest/grav",
        method: "get"
        success: (data, textStatus, jqXHR) =>
          @$el.html helper.get_template("me", {grav: data})
      @
  module.exports = Me
