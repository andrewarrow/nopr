class window.FriendController extends ApplicationController
  constructor: (@j) ->

  index: () ->
    json = {}
    @j('#nopr').html Mustache.render(window.router.views.friend.index, json)

