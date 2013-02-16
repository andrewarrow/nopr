class window.HomeController extends ApplicationController
  constructor: (@j, @selector) ->
    @current_user = null
    @friends = []

  index: () ->
    json = {current_user: @current_user}
    success = () =>
      @j(@selector).html Mustache.render(Foo.bar, json)

      if @current_user
        FB.api '/me/friends', (friends) =>
          @friends = friends.data.slice(0, 20)
          @j('#friends').html('wefwe')

    @j.getScript '/section1', success

  fb_connect: (e) ->
    e.preventDefault()
    FacebookHelper.connect () =>
      FB.api '/me', (me) =>
        if me.id?
          @current_user = {name: me.name}
          @index()

  logout: (e) ->
    e.preventDefault()
    @current_user = null
    @index()
