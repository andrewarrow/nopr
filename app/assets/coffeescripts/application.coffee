find_id = (e) ->
  t = $(e.target).attr('id')
  c = $(e.currentTarget).attr('id')
  return t if t
  return c

$ ->
  hc = new HomeController($, '#home')
  hc.index()

  $('#home').on 'click', 'a.nopr-link', (e) ->
    hc[find_id(e)](e)
