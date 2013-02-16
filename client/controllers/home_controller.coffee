class window.HomeController extends ApplicationController
  constructor: (@e, @selector) ->
    @e.preventDefault()

  fb_connect: () ->
    FacebookHelper.connect () =>
      FB.api '/me', (resp) =>
        if resp.id?
          @selector.html(resp.name + ' <a href="#" id="logout">log out</a>')

