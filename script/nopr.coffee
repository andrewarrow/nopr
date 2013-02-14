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
  template = fs.readFileSync "#{__dirname}/../app/views/layouts/application.mustache"
  #data = eco.render template.toString(), {user_id: FayeWeb.test_users[username], name: name, username: username}
  output = Mustache.render(template.toString(), {name: 'wefwef'});
  response.write output.toString()
  response.end()

  #@response.writeHead 404, {'Content-Type': 'text/plain'}
  #@response.write "Not Found"
  #@response.end()
server.listen 8000
