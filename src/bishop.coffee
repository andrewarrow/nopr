{BasePiece} = require './base_piece'
{Move}      = require './move'

class exports.Bishop extends BasePiece
  constructor: (@color, @board) ->

  all_moves: (i, j) ->
    options = []

    for dir in ['north_east', 'north_west', 'south_east', 'south_west']
      direction_okay = true
      for distance in [1..7]
        if direction_okay
          sq = @[dir] distance
          if sq.empty()
            options.push new Move(@, sq)
          else if sq.enemy(@color)
            options.push new Move(@, sq)
            direction_okay = false
          else if !sq.enemy(@color)
            direction_okay = false

    options

  to_s: () ->
    @color+'b'
