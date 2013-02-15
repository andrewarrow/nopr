fs            = require 'fs'
Mustache      = require 'mustache'
{Config} = require '../../config/environments/development'

class exports.ApplicationController
  constructor: (@response) ->

  filters: () ->
    @template_json = {fb_app_id: Config.fb_app_id}

  render: () ->
    @response.writeHead 200, {'Content-Type': 'text/html'}
    layout = fs.readFileSync "#{__dirname}/../views/layouts/application.mustache"
    template = fs.readFileSync "#{__dirname}/../views/home/index.mustache"

    @template_json.content = Mustache.render(template.toString(), @template_json)
    output = Mustache.render(layout.toString(), @template_json)
    @response.write output
    @response.end()

