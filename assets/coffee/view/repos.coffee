define [
  'module'
  'backbone'
  'helper'
  'site'
  'collection/repos'
  'view/repo'
],
(module, Backbone, helper, site, Repos, RepoView) ->
  class ReposView extends Backbone.View
    tagName: "ul"
    className: "perspective"
    views: []
    attributes:
      id: "repos"

    events: {}

    initialize: ->

    render: ->
      @collection = new Repos()
      @collection.fetch
        success: (results) =>
          results.each (model, index, list) =>
            view = new RepoView model: model, place: index
            view.render()
            @views.push view
            @$el.append view.$el

            if index is (list.length - 1)
              helper.set_height(@collection, @$el, helper.project_colls() * 2)()
      @

    in_viewport: ->
      _.each @views, (view, index) ->
        if view.in_view_port_full()
          factor = view.place % (helper.project_colls() * 2)
          setTimeout ->
            view.$el.removeClass "hide"
          , helper.animation_delay(factor)

  module.exports = ReposView
