class exports.Knight extends BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  all_moves: (i, j) ->
    options = []

    options

  to_s: () ->
    @color+'h'
