class exports.Cords
  constructor: (@sq, @i, @j, @player) ->

  blank: () ->
    @sq == '' and @sq != undefined

  enemy: () ->
    return false if @sq == undefined
    color = @sq[0]
    return false if color == @player
    @sq != ''

  equals: (cords) ->
    @sq == cords.sq and @i == cords.i and @j == cords.j

  
