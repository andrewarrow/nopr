CoffeeScript  = require 'coffee-script'
web           = require 'http'
url           = require 'url'
fs            = require 'fs'
eco           = require 'eco'
Mustache      = require 'mustache'

server = web.createServer (request, response) ->
  url_parts = url.parse(request.url, true)
  method = []
  tokens = url_parts.pathname.split('/')
  response.writeHead 200, {'Content-Type': 'text/html'}
  layout = fs.readFileSync "#{__dirname}/../app/views/layouts/application.mustache"
  template = fs.readFileSync "#{__dirname}/../app/views/home/index.mustache"
  content = Mustache.render(template.toString(), {name: 'wefwef'});
  output = Mustache.render(layout.toString(), {content: content});
  response.write output
  response.end()

  #@response.writeHead 404, {'Content-Type': 'text/plain'}
  #@response.write "Not Found"
  #@response.end()
server.listen 3000
