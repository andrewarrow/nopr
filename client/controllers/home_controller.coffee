class window.HomeController extends ApplicationController
  constructor: (@j, @selector) ->
    @current_user = null
    @friends = []

  index: () ->
    json = {current_user: @current_user, friends: @friends}
    success = (text) =>
      @j(@selector).html Mustache.render(text, json)

    @j.ajax '/view', {type: 'GET', success: success}

  fb_connect: (e) ->
    e.preventDefault()
    FacebookHelper.connect () =>
      FB.api '/me', (me) =>
        if me.id?
          @current_user = {name: me.name}
          FB.api '/me/friends', (friends) =>
            @friends = friends.data
            @index()

  logout: (e) ->
    e.preventDefault()
    @current_user = null
    @index()
