{BasePiece} = require './base_piece'
{Move}      = require './move'

class exports.King extends BasePiece
  constructor: (@color, @board) ->

  all_moves: (i, j) ->
    options = []

    for dir in ['north', 'south', 'east', 'west', 'north_east', 'north_west', 'south_east', 'south_west']
      sq = @[dir] 1
      if sq.empty_or_enemy(@color)
        options.push new Move(@, sq)

    options

  to_s: () ->
    @color+'k'
