class exports.Rook
  constructor: (@board) ->

  all_moves: (i, j) ->
    options = []
    options

    ###
    cords = @board.look_n i, j
    console.log cords
    while cords.ok()
      cords = @board.look_n cords.i, j

    options

