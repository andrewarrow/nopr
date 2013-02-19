class exports.Cords
  constructor: (@sq, @i, @j) ->

  blank: () ->
    @sq == '' and @sq != undefined

  occupied: () ->
    @sq != '' and @sq != undefined

  ok: () ->
    @sq != undefined

  equals: (cords) ->
    @sq == cords.sq and @i == cords.i and @j == cords.j

  
