class exports.BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  north: (plus) ->
    @board.rows[@i-1+plus][@j]
