class window.HomeController extends ApplicationController
  constructor: (@e, @selector) ->
    @e.preventDefault()

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
