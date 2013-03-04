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
    buffer.push {letter: letters[index-2], row: row + 1}
    buffer.push {letter: letters[index-2], row: row - 1}

    buffer.push {letter: letters[index+2], row: row + 1}
    buffer.push {letter: letters[index+2], row: row - 1}

    buffer.push {letter: letters[index+1], row: row + 2}
    buffer.push {letter: letters[index-1], row: row + 2}

    buffer.push {letter: letters[index+1], row: row - 2}
    buffer.push {letter: letters[index-1], row: row - 2}

    cleaned = []
    for result in buffer
      if result.letter != undefined and result.row != undefined
        cleaned.push result

    cleaned

  to_s: () ->
    @color+'n'
