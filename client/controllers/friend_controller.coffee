class window.FriendController extends ApplicationController
  constructor: (@j, @selector) ->

  index: () ->
    @j(@selector).html 'wefwefwefwe'

