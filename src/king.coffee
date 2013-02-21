class exports.King
  constructor: (@board) ->

  all_moves: (i, j) ->
    options = []

    cords = @board.look_ne i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_se i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_nw i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_sw i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_s i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_n i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_e i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_w i, j
    if cords.blank() or cords.enemy()
      options.push @board.create_move(i, j, cords)
    options
