class exports.Rook
  constructor: (@color, @board) ->

  all_moves: (i, j) ->
    options = []

    cords = @board.look_n i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_n cords.i, j

    cords = @board.look_s i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_s cords.i, j

    cords = @board.look_e i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_e i, cords.j

    cords = @board.look_w i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_w i, cords.j

    options
