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
    orig_i = @i
    orig_j = @j

    sq = @['north'] 2
    @i = sq.i
    sq = @['east'] 1
    @i = orig_i
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['north'] 2
    @i = sq.i
    sq = @['west'] 1
    @i = orig_i
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['south'] 2
    @i = sq.i
    sq = @['east'] 1
    @i = orig_i
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['south'] 2
    @i = sq.i
    sq = @['west'] 1
    @i = orig_i
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}


      #########


    sq = @['west'] 2
    @j = sq.j
    sq = @['north'] 1
    @j = orig_j
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['west'] 2
    @j = sq.j
    sq = @['south'] 1
    @j = orig_j
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['east'] 2
    @j = sq.j
    sq = @['north'] 1
    @j = orig_j
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    sq = @['east'] 2
    @j = sq.j
    sq = @['south'] 1
    @j = orig_j
    if sq.empty() or sq.enemy(@color)
      options.push {from: @, to: sq}

    options

  to_s: () ->
    @color+'h'
