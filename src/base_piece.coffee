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

  check: (object) ->
    return new OutOfBounds() if object == undefined
    object

  north: (plus) ->
    try
      @check @board.rows[@i + ( plus * @north_direction() )][@j]
    catch e
      new OutOfBounds()

  north_east: (plus) ->
    try
      @check @board.rows[@i + ( plus * @north_direction() )][@j + (plus * @east_direction())]
    catch e
      new OutOfBounds()

  north_west: (plus) ->
    try
      @check @board.rows[@i + ( plus * @north_direction() )][@j + (plus * @west_direction())]
    catch e
      new OutOfBounds()

  enemy: (my_color) ->
    @color != my_color
