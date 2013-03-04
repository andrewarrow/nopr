{BasePiece} = require './base_piece'
{Move}      = require './move'

class exports.Bishop extends BasePiece
  constructor: (@color, @board) ->
    @code = 'B'

  @moves_from: (letter, row) ->
    letters = 'abcdefgh'
    index = letters.indexOf letter

    buffer = []

    BasePiece.add_move buffer, letters[index-2], row + 1

    buffer

  to_s: () ->
    @color+'b'
