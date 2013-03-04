{OutOfBounds} = require './out_of_bounds'
{Empty} = require './empty'

class exports.BasePiece

  @add_move: (buffer, letter, row) ->
    if letter != undefined and row < 9 and row > 0
      buffer.push {letter: letter, row: row}

  enemy: (my_color) ->
    @color != my_color

  friend: (my_color) ->
    @color == my_color

  empty_or_enemy: (my_color) ->
    @enemy(my_color)

  empty: () ->
    false
