CoffeeScript  = require 'coffee-script'
web           = require 'http'
url           = require 'url'
fs            = require 'fs'
eco           = require 'eco'

server = web.createServer (request, response) ->
  console.log request
server.listen 8000
