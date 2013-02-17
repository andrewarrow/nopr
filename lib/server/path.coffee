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
    @without_ext = parts[0]

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

  assemble_controller: (name) ->
    dir = "#{__dirname}/../../client/views/#{name}"
    files = fs.readdirSync dir
    buffer = []
    buffer.push "window.router.views.#{name} = {}"
    for file in files
      raw = fs.readFileSync("#{dir}/#{file}")
      view_str = raw.toString()
      view = file.split('.')[0]
      buffer.push "window.router.views.#{name}.#{view} = #{JSON.stringify(view_str)};"

    raw = fs.readFileSync("#{__dirname}/../../client/controllers/#{name}_controller.coffee")
    data = CoffeeScript.compile raw.toString()
    buffer.push data
    buffer.join('\n')

  render_coffee: () ->
    type = 'application/javascript'
    dir = "#{__dirname}/../../app/assets/coffeescripts"
    files = fs.readdirSync dir
    buffer = []
    for file in files
      if file.indexOf('.swp') == -1
        raw = fs.readFileSync("#{dir}/#{file}")
        data = CoffeeScript.compile raw.toString()
        buffer.push data
    raw = fs.readFileSync("#{__dirname}/../../client/controllers/application_controller.coffee")
    data = CoffeeScript.compile raw.toString()
    buffer.push data
    buffer.push @assemble_controller('home')
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
    raw = fs.readFileSync("#{__dirname}/../../client/views/home/friends.mustache")
    friends = raw.toString()
    @response.writeHead 200, {'Content-Type': "application/javascript"}
    @response.write "Foo = {}; Foo.index = #{JSON.stringify(index)};"
    @response.write "Foo.partials = {}; Foo.partials.friends = #{JSON.stringify(friends)};"
    @response.end()
  render_controller: () ->
    type = 'application/javascript'
    data = @assemble_controller(@without_ext)
    @render_file data, type

  render: () ->
    console.log @pathname
    if @root == ''
      controller = new HomeController(@response)
      controller.index()
      return
    if @["render_#{@ext}"]?
      @["render_#{@ext}"]()
