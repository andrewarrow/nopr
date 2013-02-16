$ ->
  hc = new HomeController($, '#home')
  hc.index()

  $('#home').on 'click', 'a#fb_connect', (e) ->
    #hc = new HomeController(e, $('#home'))
    #hc.fb_connect()

  $('#home').on 'click', 'a#logout', (e) ->
    #hc = new HomeController(e, $('#home'))
    #hc.logout()
