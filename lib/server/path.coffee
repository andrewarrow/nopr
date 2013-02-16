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
      raw = ''
      if @root == 'assets'
        raw = fs.readFileSync("#{__dirname}/../../app/assets/coffeescripts/#{@file}")
      else
        raw = fs.readFileSync("#{__dirname}/../../client/controllers/#{@file}")
      data = CoffeeScript.compile raw.toString()
    else if @ext == 'png'
      type = 'image/png'
      data = fs.readFileSync("#{__dirname}/../../app/assets/images/#{@file}")
    else if @ext == 'js'
      type = 'application/javascript'
      data = fs.readFileSync("#{__dirname}/../../node_modules/mustache/#{@file}")
    @render_file data, type

  render_file: (data, type) ->
    @response.writeHead 200, {'Content-Type': "#{type}"}
    @response.write data
    @response.end()

  render: () ->
    if @root == 'assets' or @root == 'client' or @root == 'node_modules'
      @load_file()
    else if @root == 'section1'
      raw = fs.readFileSync("#{__dirname}/../../client/views/home/index.mustache")
      foo = raw.toString()
      #json = {index: raw.toString(), partials: []}
      json = {index: foo, partials: []}
      @response.writeHead 200, {'Content-Type': "application/javascript"}
      @response.write "Foo = {}; Foo.bar = #{JSON.stringify(foo)};"
      @response.end()
    else
      controller = new HomeController(@response)
      controller.index()
