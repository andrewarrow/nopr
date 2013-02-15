fs            = require 'fs'
Mustache      = require 'mustache'

{ApplicationController} = require './application_controller'

class exports.HomeController extends ApplicationController

  index: () ->
    @filters()
    @template_json.name = 'fred'
    @render()

    ###
      @response.writeHead 200, {'Content-Type': 'text/html'}
      layout = fs.readFileSync "#{__dirname}/../../app/views/layouts/application.mustache"
      template = fs.readFileSync "#{__dirname}/../../app/views/home/index.mustache"
      content = Mustache.render(template.toString(), {name: 'wefwef'})
      output = Mustache.render(layout.toString(), {content: content})
      @response.write output
      @response.end()
