{BasePiece} = require './base_piece'
{Move}      = require './move'

class exports.Knight extends BasePiece
  constructor: (@color, @board) ->
    @code = 'N'

  @moves_from: (letter, row) ->
    letters = 'abcdefgh'
    index = letters.indexOf letter

    # up 2 rows, 1 left, 1 right
    # down 2 rows, 1 left, 1 right
    # left 2 letters, 1 up, 1 down
    # right 2 letters, 1 up, 1 down

    buffer = []
    BasePiece.add_move buffer, letters[index-2], row + 1

    BasePiece.add_move buffer, letters[index-2], row + 1
    BasePiece.add_move buffer, letters[index-2], row - 1

    BasePiece.add_move buffer, letters[index+2], row + 1
    BasePiece.add_move buffer, letters[index+2], row - 1

    BasePiece.add_move buffer, letters[index+1], row + 2
    BasePiece.add_move buffer, letters[index-1], row + 2

    BasePiece.add_move buffer, letters[index+1], row - 2
    BasePiece.add_move buffer, letters[index-1], row - 2
    buffer

  to_s: () ->
    @color+'n'
