{Pawn}   = require './pawn'
{Rook}   = require './rook'
{Horse}  = require './horse'
{Bishop} = require './bishop'
{King}   = require './king'
{Queen}  = require './queen'
{Cords}  = require './cords'
{Move}   = require './move'

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
    @p['h'] = new Horse(@)
    @p['b'] = new Bishop(@)
    @p['k'] = new King(@)
    @p['q'] = new Queen(@)
    @p['p'] = new Pawn(@)
    done()

  create_move: (i, j, cords) ->
    from = new Cords(@rows[i][j], i, j, @player)
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
    console.log buffer
    buffer

  # - - - - - - - - - - - - - - - - - - - - - #
  #               LOOK METHODS                #
  # - - - - - - - - - - - - - - - - - - - - - #

  make_cords: (i, j) ->
    try
      new Cords(@rows[i][j], i, j, @player)
    catch error
      new Cords(undefined, i, j, @player)

  look_n: (i, j) ->
    if @player == 'w'
      @make_cords i-1, j
    else
      @make_cords i+1, j
  look_ne: (i, j) ->
    if @player == 'w'
      @make_cords i-1, j+1
    else
      @make_cords i+1, j-1
  look_nw: (i, j) ->
    if @player == 'w'
      @make_cords i-1, j-1
    else
      @make_cords i+1, j+1

  look_s: (i, j) ->
    if @player == 'w'
      @make_cords i+1, j
    else
      @make_cords i-1, j
  look_se: (i, j) ->
    if @player == 'w'
      @make_cords i+1, j+1
    else
      @make_cords i-1, j-1
  look_sw: (i, j) ->
    if @player == 'w'
      @make_cords i+1, j-1
    else
      @make_cords i-1, j+1

  look_e: (i, j) ->
    if @player == 'w'
      @make_cords i, j-1
    else
      @make_cords i, j+1

  look_w: (i, j) ->
    if @player == 'w'
      @make_cords i, j+1
    else
      @make_cords i, j-1
