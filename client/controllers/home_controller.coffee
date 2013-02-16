class window.HomeController extends ApplicationController
  constructor: (@j, @selector) ->
    @current_user = null

  index: () ->
    json = {current_user: @current_user}
    success = (text) =>
      @j(@selector).html Mustache.render(text, json)

    @j.ajax '/view', {type: 'GET', success: success}

  fb_connect: (e) ->
    e.preventDefault()
    FacebookHelper.connect () =>
      FB.api '/me', (resp) =>
        if resp.id?
          @current_user = {name: resp.name}
          @index()

  logout: (e) ->
    e.preventDefault()
    @current_user = null
    @index()
