class exports.Horse
  constructor: (@board) ->
    @first_move = true

  all_moves: (i, j) ->
    options = []

    # north
    cords = @board.look_n i, j
    cords = @board.look_n cords.i, j
    east = @board.look_e cords.i, j
    west = @board.look_w cords.i, j
    if east.enemy() or east.blank()
      options.push @board.create_move(i, j, east)
    if west.enemy() or west.blank()
      options.push @board.create_move(i, j, west)

    # south
    cords = @board.look_n i, j
    cords = @board.look_n cords.i, j
    east = @board.look_e cords.i, j
    west = @board.look_w cords.i, j
    if east.enemy() or east.blank()
      options.push @board.create_move(i, j, east)
    if west.enemy() or west.blank()
      options.push @board.create_move(i, j, west)

    options

