{BasePiece} = require './base_piece'
{Empty}     = require './empty'

class exports.Pawn extends BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  all_moves: () ->
    options = []

    north = @north 1
    if north instanceof Empty
      options.push {from: @, to: north}

    north = @north 2
    if north instanceof Empty and @first_move
      options.push {from: @, to: north}

    ne = @north_east 1
    if ne.enemy()
      options.push {from: @, to: ne}

    nw = @north_west 1
    if nw.enemy()
      options.push {from: @, to: nw}

    options

  to_s: () ->
    @color+'p'
