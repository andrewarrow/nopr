web = require 'http'
server = undefined

class exports.SpecHelper
  @stop: () ->
    server.close()
 
  @start: () ->
    server = web.createServer (req, res) ->
      res.writeHead 200, {'Content-Type': 'text/html'}
      res.write ''
      res.end()

    server.listen 3000
  
  @http: (path, done) ->
    opts = {
      host: 'localhost'
      hostname: 'localhost'
      path: path
      port: 3000
    }

    opts.agent = false

    request = web.get opts, (response) =>
      code = response.statusCode
      done(code)
