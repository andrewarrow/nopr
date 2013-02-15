$ ->
  $('#fb_connect').click (e) ->
    e.preventDefault()
    FacebookHelper.connect () ->
      console.log 3

