{BasePiece} = require './base_piece'
{Empty}     = require './empty'

class exports.Pawn extends BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  all_moves: () ->
    options = []

    north = @north 1
    if north.empty()
      options.push {from: @, to: north}

    north = @north 2
    if north.empty() and @first_move
      options.push {from: @, to: north}

    for dir in ['north_east', 'north_west']
      sq = @[dir] 1
      if sq.enemy(@color)
        options.push {from: @, to: sq}

    options

  to_s: () ->
    @color+'p'
