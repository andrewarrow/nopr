class window.HomeController extends ApplicationController
  constructor: (@j, @selector) ->
    @current_user = null
    @friends = []

  index: () ->
    json = {current_user: @current_user}
    success = () =>
      @j(@selector).html Mustache.render(Foo.index, json)

      if @current_user
        FB.api '/me/friends', (friends) =>
          @friends = friends.data.slice(0, 20)
          @j('#friends').html Mustache.render(Foo.partials.friends, {friends: @friends})

    @j.getScript '/section1.section', success

  select_friend: (e) ->
    e.preventDefault()
    id = @j(e.target).attr('data-value')
    @j(@selector).html 'hi '+id

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
