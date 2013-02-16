CoffeeScript  = require 'coffee-script'
fs            = require 'fs'
Mustache      = require 'mustache'

{HomeController} = require '../../app/controllers/home_controller'

class exports.Path
  constructor: (@pathname, @response) ->
    tokens = @pathname.split('/')
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

  loop_dir: (path) ->
    dir = "#{__dirname}/../../#{path}"
    files = fs.readdirSync dir
    buffer = []
    for file in files
      raw = fs.readFileSync("#{dir}/#{file}")
      buffer.push raw.toString()
    buffer.join('\n')

  render_coffee: () ->
    type = 'application/javascript'
    dir = "#{__dirname}/../../app/assets/coffeescripts"
    files = fs.readdirSync dir
    buffer = []
    for file in files
      raw = fs.readFileSync("#{dir}/#{file}")
      data = CoffeeScript.compile raw.toString()
      buffer.push data
    dir = "#{__dirname}/../../client/controllers"
    files = fs.readdirSync dir
    for file in files
      raw = fs.readFileSync("#{dir}/#{file}")
      data = CoffeeScript.compile raw.toString()
      buffer.push data
    @render_file buffer.join('\n'), type
  render_js: () ->
    type = 'application/javascript'
    @render_file @loop_dir('app/assets/javascripts'), type
  render_png: () ->
    type = 'image/png'
    data = fs.readFileSync("#{__dirname}/../../app/assets/images/#{@file}")
    @render_file data, type
  render_css: () ->
    type = 'text/css'
    @render_file @loop_dir('app/assets/stylesheets'), type
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
    console.log @pathname
    if @root == ''
      controller = new HomeController(@response)
      controller.index()
      return
    if @["render_#{@ext}"]?
      @["render_#{@ext}"]()
