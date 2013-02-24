{BasePiece} = require './base_piece'
class exports.Rook extends BasePiece
  constructor: (@color, @board) ->

  all_moves: () ->
    options = []

    for dir in ['north', 'south', 'east', 'west']
      direction_okay = true
      for distance in [1..7]
        if direction_okay
          sq = @[dir] distance
          console.log 'fred', sq.to_s()
          if sq.empty()
            console.log 'fred', 'empty'
            options.push {from: @, to: sq}
          else if sq.enemy(@color)
            console.log 'fred', 'enemy'
            options.push {from: @, to: sq}
            direction_okay = false

    options

  to_s: () ->
    @color+'r'
