fs            = require 'fs'
Mustache      = require 'mustache'

class exports.Path
  constructor: (tokens, @response) ->
    @root = tokens[1]
    @file = tokens[2]

  render_file: (file) ->
    @response.writeHead 200, {'Content-Type': 'text/css'}
    file = fs.readFileSync "#{__dirname}/../../app/assets/stylesheets/"+file
    @response.write file.toString()
    @response.end()

  render: () ->
    if @root == 'assets'
      @render_file @file
    else
      @response.writeHead 200, {'Content-Type': 'text/html'}
      layout = fs.readFileSync "#{__dirname}/../../app/views/layouts/application.mustache"
      template = fs.readFileSync "#{__dirname}/../../app/views/home/index.mustache"
      content = Mustache.render(template.toString(), {name: 'wefwef'})
      output = Mustache.render(layout.toString(), {content: content})
      @response.write output
      @response.end()
