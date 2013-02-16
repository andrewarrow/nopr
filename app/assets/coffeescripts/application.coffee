class window.Router
  constructor: () ->
    @controllers = {}
    @controllers.home = new HomeController($, '#home')

  find_route: (e) ->
    t = $(e.target).attr('data-value')
    c = $(e.currentTarget).attr('data-value')
    return t if t
    return c
      
$ ->
  router = new Router()
  router.controllers.home.index()

  $('#home').on 'click', 'a.nopr-link', (e) ->
    tokens = router.find_route(e).split('/')
    controller = tokens[0]
    action = tokens[1]

    router.controllers[controller][action](e)
