fs            = require 'fs'
Mustache      = require 'mustache'

{ApplicationController} = require './application_controller'

class exports.HomeController extends ApplicationController

  index: () ->
    @filters()
    @template_json.name = 'fred'
    @render()

