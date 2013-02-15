CoffeeScript  = require 'coffee-script'
fs            = require 'fs'
Mustache      = require 'mustache'

class exports.Path
  constructor: (tokens, @response) ->
    @root = tokens[1]
    @size = tokens.length
    @file = tokens[@size - 1]
    parts = @file.split('.')
    @ext = parts[parts.length-1]

  load_file: () ->
    type = undefined
    data = undefined
    if @ext == 'css'
      type = 'text/css'
      data = fs.readFileSync("#{__dirname}/../../app/assets/stylesheets/#{@file}")
    else if @ext == 'coffee'
      type = 'application/javascript'
      raw  = fs.readFileSync("#{__dirname}/../../app/assets/coffeescripts/#{@file}")
      data = CoffeeScript.compile raw.toString()
    @render_file data, type

  render_file: (data, type) ->
    @response.writeHead 200, {'Content-Type': "#{type}"}
    @response.write data.toString()
    @response.end()

  render: () ->
    if @root == 'assets'
      @load_file()
    else
      @response.writeHead 200, {'Content-Type': 'text/html'}
      layout = fs.readFileSync "#{__dirname}/../../app/views/layouts/application.mustache"
      template = fs.readFileSync "#{__dirname}/../../app/views/home/index.mustache"
      content = Mustache.render(template.toString(), {name: 'wefwef'})
      output = Mustache.render(layout.toString(), {content: content})
      @response.write output
      @response.end()
