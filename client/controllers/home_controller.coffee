class window.HomeController extends ApplicationController
  constructor: (@j, @selector) ->

  index: () ->
    json = {current_user: null}
    success = (text) =>
      console.log text
      @j(@selector).html Mustache.render(text, json)

    @j.ajax '/view', {type: 'GET', success: success}

  fb_connect: () ->
    FacebookHelper.connect () =>
      FB.api '/me', (resp) =>
        if resp.id?
          json = {name: resp.name}
          template = 'Welcome {{name}} <a href="#" id="logout">log out</a>'
          @selector.html Mustache.render(template, json)

  logout: () ->
    json = {}
    template = '<a href="#" id="fb_connect"><img src="/assets/fb_connect.png"/></a>'
    @selector.html Mustache.render(template, json)
