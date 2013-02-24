{BasePiece} = require './base_piece'
class exports.Knight extends BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  all_moves: (i, j) ->
    options = []

    #  xxx
    # x x x
    # xxxxx
    # x x x
    #  xxx    
    for dir in ['north', 'south', 'east', 'west', 'north_east', 'north_west', 'south_east', 'south_west']
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
    @color+'h'
