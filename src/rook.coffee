{BasePiece} = require './base_piece'
class exports.Rook extends BasePiece
  constructor: (@color, @board) ->

  all_moves: (i, j) ->
    options = []

    for dir in ['north', 'south', 'east', 'west']
      direction_okay = true
      for distance in [1..7]
        if direction_okay
          sq = @[dir] distance
          if sq.empty()
            options.push {from: @, to: sq}
          else if sq.enemy(@color)
            options.push {from: @, to: sq}
            direction_okay = false

    options

  to_s: () ->
    @color+'r'
