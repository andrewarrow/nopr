CoffeeScript  = require 'coffee-script'
web           = require 'http'
url           = require 'url'
{Asset}       = require '../lib/server/asset'
{Path}        = require '../lib/server/path'

server = web.createServer (request, response) ->
  url_parts = url.parse(request.url, true)
  tokens = url_parts.pathname.split('/')
  path = new Path(tokens, response)
  path.render()

  #@response.writeHead 404, {'Content-Type': 'text/plain'}
  #@response.write "Not Found"
  #@response.end()
server.listen 3000
