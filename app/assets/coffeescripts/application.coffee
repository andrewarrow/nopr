$ ->
  hc = new HomeController($, '#home')
  hc.index()

  $('#home').on 'click', 'a#fb_connect', (e) ->
    hc.fb_connect(e)

  $('#home').on 'click', 'a#logout', (e) ->
    hc.logout(e)
