{OutOfBounds} = require './out_of_bounds'

class exports.BasePiece

  north_direction: () ->
    return -1 if @color == 'w'
    1

  south_direction: () ->
    return -1 if @color == 'b'
    1

  west_direction: () ->
    return -1 if @color == 'w'
    1

  east_direction: () ->
    return -1 if @color == 'b'
    1

  check: (i, j) ->
    try
      object = @board.rows[i][j]
      return new OutOfBounds() if object == undefined
      object
    catch e
      new OutOfBounds()

  north: (plus) ->
    @check @i + (plus * @north_direction()), @j

  north_east: (plus) ->
    @check @i + (plus * @north_direction()), @j + (plus * @east_direction())

  north_west: (plus) ->
    @check @i + (plus * @north_direction()), @j + (plus * @west_direction())

  south: (plus) ->
    @check @i + (plus * @south_direction()), @j

  south_east: (plus) ->
    @check @i + (plus * @south_direction()), @j + (plus * @east_direction())

  south_west: (plus) ->
    @check @i + (plus * @south_direction()), @j + (plus * @west_direction())

  east: (plus) ->
    @check @i + (plus * @east_direction()), @j

  west: (plus) ->
    @check @i + (plus * @west_direction()), @j

  enemy: (my_color) ->
    @color != my_color
