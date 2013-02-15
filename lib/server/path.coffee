CoffeeScript  = require 'coffee-script'
fs            = require 'fs'
Mustache      = require 'mustache'

{HomeController} = require '../../app/controllers/home_controller'

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
    else if @ext == 'png'
      type = 'image/png'
      data = fs.readFileSync("#{__dirname}/../../app/assets/images/#{@file}")
    @render_file data, type

  render_file: (data, type) ->
    @response.writeHead 200, {'Content-Type': "#{type}"}
    @response.write data
    @response.end()

  render: () ->
    if @root == 'assets'
      @load_file()
    else
      controller = new HomeController(@response)
      controller.index()
