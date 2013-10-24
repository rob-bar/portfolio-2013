async = require "async"
mongoose = require "mongoose"
config = require "../config/config.coffee"
socials = require "../data/socials.coffee"
navs = require "../data/navs.coffee"
projects = require "../data/projects.coffee"
github = require "../data/github.coffee"
delicious = require "../data/delicious.coffee"
twitter = require "../data/twitter.coffee"
instagram = require "../data/instagram.coffee"
analytics = require "../data/analytics.coffee"

mongoose.connect "mongodb://localhost/portfolio"
cnt = 0
exports.other =
  index: (req, res) ->
    crypto = require "crypto"
    md5 = crypto.createHash "md5"
    url = md5.update(config.site.grav.email).digest "hex"
    url = config.site.grav.url.replace /hash/, url

    async.series
      socials: (callback) ->
        socials.data.actives (docs) ->
          callback(null, docs)

      navs: (callback) ->
        navs.data.actives (docs) ->
          callback(null, docs)

      (err, results) ->
        results.title = "My portfolio"
        results.grav = url

        # NOT ON ITS PLACE HERE
        if config.site.mode is "production"
          results.ga = config.site.ga
        else
          results.ga = config.site.fake_ga

        res.render "pages/index", results
    @

  cv: (req, res, next) ->
    res.header "Accept-Ranges", "none"
    analytics.data.add_cv_link_click (str) ->
      next()

exports.rest =
  works: (req, res) ->
    projects.data.actives (works) ->
      res.json works
      res.end()

  socials: (req, res) ->
    socials.data.actives (socials) ->
      res.json socials
      res.end()

  navs: (req, res) ->
    navs.data.actives (navs) ->
      res.json navs
      res.end()

  repos: (req, res) ->
    github.data.all (data) ->
      res.json data
      res.end()
    ,req

  links: (req, res) ->
    delicious.data.all (data) ->
      res.json data
      res.end()
    ,req

  tweets: (req, res) ->
    twitter.data.all (data) ->
      res.json data
      res.end()
    ,req

  pics: (req, res) ->
    instagram.data.all (data) ->
      res.json data.data
      res.end()
    ,req
