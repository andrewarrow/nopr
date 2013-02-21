class exports.Knight
  constructor: (@color, @board) ->
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
    cords = @board.look_s i, j
    cords = @board.look_s cords.i, j
    east = @board.look_e cords.i, j
    west = @board.look_w cords.i, j
    if east.enemy() or east.blank()
      options.push @board.create_move(i, j, east)
    if west.enemy() or west.blank()
      options.push @board.create_move(i, j, west)

    # east
    cords = @board.look_e i, j
    cords = @board.look_e i, cords.j
    north = @board.look_n i, cords.j
    south = @board.look_s i, cords.j
    if north.enemy() or north.blank()
      options.push @board.create_move(i, j, north)
    if south.enemy() or south.blank()
      options.push @board.create_move(i, j, south)

    # west
    cords = @board.look_w i, j
    cords = @board.look_w i, cords.j
    north = @board.look_n i, cords.j
    south = @board.look_s i, cords.j
    if north.enemy() or north.blank()
      options.push @board.create_move(i, j, north)
    if south.enemy() or south.blank()
      options.push @board.create_move(i, j, south)

    options

