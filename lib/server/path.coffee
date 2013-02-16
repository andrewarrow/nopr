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

  render_coffee: () ->
    type = 'application/javascript'
    data = ''
    @render_file data, type
  render_js: () ->
    type = 'application/javascript'
    data = fs.readFileSync("#{__dirname}/../../node_modules/mustache/#{@file}")
    @render_file '', type
  render_png: () ->
    type = 'image/png'
    data = fs.readFileSync("#{__dirname}/../../app/assets/images/#{@file}")
    @render_file data, type
  render_css: () ->
    type = 'text/css'
    data = fs.readFileSync("#{__dirname}/../../app/assets/stylesheets/#{@file}")
    @render_file data, type
  render_section: () ->
    raw = fs.readFileSync("#{__dirname}/../../client/views/home/index.mustache")
    index = raw.toString()
    raw = fs.readFileSync("#{__dirname}/../../client/views/home/_friends.mustache")
    friends = raw.toString()
    @response.writeHead 200, {'Content-Type': "application/javascript"}
    @response.write "Foo = {}; Foo.index = #{JSON.stringify(index)};"
    @response.write "Foo.partials = {}; Foo.partials.friends = #{JSON.stringify(friends)};"
    @response.end()

  render: () ->
    if @root == ''
      controller = new HomeController(@response)
      controller.index()
      return
    if @["render_#{@ext}"]?
      @["render_#{@ext}"]()
