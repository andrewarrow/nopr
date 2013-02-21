{BasePiece} = require './base_piece'
class exports.Bishop extends BasePiece
  constructor: (@color, @board) ->

  all_moves: (i, j) ->
    options = []


    options

  to_s: () ->
    @color+'b'
