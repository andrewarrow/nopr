{BasePiece} = require './base_piece'
{Empty}     = require './empty'

class exports.Pawn extends BasePiece
  constructor: (@color, @board) ->
    @first_move = true

  all_moves: () ->
    options = []

    north = @north(0)
    if north instanceof Empty
      options.push {from: @, to: north}

    ###
    if n instanceof Empty
      n

    if n+1 instanceof Empty and @first_move
      n+1

    if ne.enemy()
      ne

    if ne.enemy()
      nw



    cords = @board.look_n @
    if cords.blank()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_n cords.i, j
    if cords.blank() and @first_move
      options.push @board.create_move(i, j, cords)

    cords = @board.look_ne i, j
    if cords.enemy()
      options.push @board.create_move(i, j, cords)

    cords = @board.look_nw i, j
    if cords.enemy()
      options.push @board.create_move(i, j, cords)
      ###
    options

