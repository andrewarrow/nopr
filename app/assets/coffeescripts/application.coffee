$ ->
  $('#home').on 'click', 'a#fb_connect', (e) ->
    hc = new HomeController(e, $('#home'))
    hc.fb_connect()

  $('#home').on 'click', 'a#logout', (e) ->
    e.preventDefault()
    $('#home').html('<a href="#" id="fb_connect"><img src="/assets/fb_connect.png"/></a>')
