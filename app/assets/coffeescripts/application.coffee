$ ->
  $('#fb_connect').click (e) ->
    e.preventDefault()
    FacebookHelper.connect () ->
      FB.api '/me', (resp) ->
        if resp.id?
          $('#main').html(resp.name + ' <a href="#" id="logout">log out</a>')


  $('#main').on 'click', 'a#logout', (e) ->
    e.preventDefault()
    $('#main').html('<a href="#" id="fb_connect"><img src="/assets/fb_connect.png"/></a>')
