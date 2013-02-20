class exports.Queen
  constructor: (@board) ->

  all_moves: (i, j) ->
    options = []

    cords = @board.look_ne i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_n cords.i, cords.j

    cords = @board.look_se i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_s cords.i, cords.j

    cords = @board.look_nw i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_e cords.i, cords.j

    cords = @board.look_sw i, j
    while cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
      cords = @board.look_w cords.i, cords.j

    options
