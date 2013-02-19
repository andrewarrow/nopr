{Pawn}  = require './pawn'
{Cords} = require './cords'

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
    @p['r'] = new Pawn(@)
    @p['h'] = new Pawn(@)
    @p['b'] = new Pawn(@)
    @p['k'] = new Pawn(@)
    @p['q'] = new Pawn(@)
    @p['p'] = new Pawn(@)
    done()

  look_n: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j], i-1, j)
    else
      new Cords(@rows[i+1][j], i+1, j)
  look_ne: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j+1], i-1, j+1)
    else
      new Cords(@rows[i+1][j-1], i+1, j-1)
  look_nw: (i, j) ->
    if @player == 'w'
      new Cords(@rows[i-1][j-1], i-1, j-1)
    else
      new Cords(@rows[i+1][j+1], i+1, j+1)

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
        buffer.push @consider_sq i, j, sq
        j++
      i++
    buffer
