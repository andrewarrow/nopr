class window.FacebookHelper
  @connect: (done) ->
    FB.getLoginStatus (res1) ->
      if res1.authResponse? and res1.status == "connected"
        done()
      else
        login_done = (res2) ->
          if res2.authResponse?
            done()
        FB.login login_done, {scope:'email,user_birthday,user_location'}


