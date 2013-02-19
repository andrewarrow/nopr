class exports.Cords
  constructor: (@sq, @i, @j) ->

  blank: () ->
    @sq == '' and @sq != undefined

  occupied: () ->
    @sq != '' and @sq != undefined


  
