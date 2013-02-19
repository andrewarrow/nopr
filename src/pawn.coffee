{Cords} = require './cords'
{Move} = require './move'

class exports.Pawn
  constructor: (@board) ->
    @first_move = true

  all_moves: (i, j) ->
    options = []

    cords = @board.look_n i, j
    if cords.blank()
      options.push {fr: i, fc: j, tr: cords.i, tc: cords.j}

    cords = @board.look_n cords.i, j
    if cords.blank() and @first_move
      options.push {fr: i, fc: j, tr: cords.i, tc: cords.j}

    cords = @board.look_ne i, j
    if cords.occupied()
      options.push {fr: i, fc: j, tr: cords.i, tc: cords.j}

    cords = @board.look_nw i, j
    if cords.occupied()
      options.push {fr: i, fc: j, tr: cords.i, tc: cords.j}

    options

