{Pawn}  = require './pawn'
{Rook}  = require './rook'
{Cords} = require './cords'
{Move}  = require './move'

class exports.Board
  constructor: () ->
    @rows = [
      ['br','bh','bb','bk','bq','bb','bh','br'],
      ['bp','bp','bp','bp','bp','bp','bp','bp'],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['wp','wp','wp','wp','wp','wp','wp','wp'],
      ['wr','wh','wb','wq','wk','wb','wh','wr']]

    @state = 'playing'
    @player = 'w'
    @p = {}

  init: (done) ->
    @p['r'] = new Rook(@)
    @p['h'] = new Pawn(@)
    @p['b'] = new Pawn(@)
    @p['k'] = new Pawn(@)
    @p['q'] = new Pawn(@)
    @p['p'] = new Pawn(@)
    done()

  create_move: (i, j, cords) ->
    from = new Cords(@rows[i][j], i, j)
    new Move(from, cords)

  consider_sq: (i, j, sq) ->
    options = []
    color = sq[0]
    type = sq[1]
    
    if color == undefined or color != @player
      return []
    else
      @p[type].all_moves i, j

  find_moves: (done) ->
    buffer = []
    i = 0
    for row in @rows
      j = 0
      for sq in row
        for move in @consider_sq i, j, sq
          buffer.push move
        j++
      i++
    buffer

  # - - - - - - - - - - - - - - - - - - - - - #
  #               LOOK METHODS                #
  # - - - - - - - - - - - - - - - - - - - - - #

  look_n: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j], i-1, j, @player)
    else
      new Cords(@rows[i+1][j], i+1, j, @player)
  look_ne: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j+1], i-1, j+1, @player)
    else
      new Cords(@rows[i+1][j-1], i+1, j-1, @player)
  look_nw: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j-1], i-1, j-1, @player)
    else
      new Cords(@rows[i+1][j+1], i+1, j+1, @player)

  look_s: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i+1][j], i+1, j, @player)
    else
      new Cords(@rows[i-1][j], i-1, j, @player)

  look_e: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i][j-1], i, j-1, @player)
    else
      new Cords(@rows[i][j+1], i, j+1, @player)

  look_w: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i][j+1], i, j+1, @player)
    else
      new Cords(@rows[i][j-1], i, j-1, @player)
