class window.HomeController extends ApplicationController
  constructor: (@e, @selector) ->
    @e.preventDefault()

  fb_connect: () ->
    FacebookHelper.connect () =>
      FB.api '/me', (resp) =>
        if resp.id?
          @selector.html(resp.name + ' <a href="#" id="logout">log out</a>')

  logout: () ->
    @selector.html('<a href="#" id="fb_connect"><img src="/assets/fb_connect.png"/></a>')
