class window.Router
  constructor: () ->
    @controllers = {}
    @views = {}

  find_route: (e) ->
    t = $(e.target).attr('data-value')
    c = $(e.currentTarget).attr('data-value')
    return t if t
    return c
      
window.router = new Router()

$ ->
  window.router.controllers.home.index()

  $('#nopr').on 'click', 'a.nopr-link', (e) ->
    e.preventDefault()
    tokens = window.router.find_route(e).split('/')
    controller_name = tokens[0]
    action = tokens[1]

    controller = window.router.controllers[controller_name]
    if controller?
      controller[action](e)
    else
      $.getScript "/#{controller_name}.controller", () ->
        window.router.controllers.friend = new FriendController($)
        controller = window.router.controllers[controller_name]
        controller[action](e)
