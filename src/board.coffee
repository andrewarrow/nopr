{Pawn}   = require './pawn'
{Rook}   = require './rook'
{Knight} = require './knight'
{Bishop} = require './bishop'
{King}   = require './king'
{Queen}  = require './queen'
{Cords}  = require './cords'
{Move}   = require './move'
{Empty}  = require './empty'

class exports.Board
  constructor: () ->
    @rows = [
      ['br','bh','bb','bk','bq','bb','bh','br'],
      ['bp','bp','bp','bp','bp','bp','bp','bp'],
      ['  ','  ','  ','  ','  ','  ','  ','  '],
      ['  ','  ','  ','  ','  ','  ','  ','  '],
      ['  ','  ','  ','  ','  ','  ','  ','  '],
      ['  ','  ','  ','  ','  ','  ','  ','  '],
      ['wp','wp','wp','wp','wp','wp','wp','wp'],
      ['wr','wh','wb','wq','wk','wb','wh','wr']]

    @rows = []
    @state = 'playing'
    @player = 'w'
    @p = {}

  init: (done) ->
    row = []
    row.push new Rook   'b', @
    row.push new Knight 'b', @
    row.push new Bishop 'b', @
    row.push new King   'b', @
    row.push new Queen  'b', @
    row.push new Bishop 'b', @
    row.push new Knight 'b', @
    row.push new Rook   'b', @
    @rows.push row

    row = []
    for i in [1..8]
      row.push new Pawn 'b', @
    @rows.push row

    for j in [1..4]
      row = []
      for i in [1..8]
        row.push new Empty()
      @rows.push row

    row = []
    for i in [1..8]
      row.push new Pawn 'w', @
    @rows.push row

    row = []
    row.push new Rook   'w', @
    row.push new Knight 'w', @
    row.push new Bishop 'w', @
    row.push new King   'w', @
    row.push new Queen  'w', @
    row.push new Bishop 'w', @
    row.push new Knight 'w', @
    row.push new Rook   'w', @
    @rows.push row

    i = 0
    for row in @rows
      j = 0
      for object in row
        object.i = i
        object.j = j
        j++
      i++

    done()

  move: (move) ->
    @rows[move.from.i][move.from.j] = '  '
    @rows[move.to.i][move.to.j] = move.from.sq
    if @player == 'b'
      @player = 'w'
    else
      @player = 'b'

  create_move: (i, j, cords) ->
    from = new Cords(@rows[i][j], i, j, @player)
    new Move(from, cords)

  consider: (object) ->
    if object == null
      return []

    if object.color != @player
      return []
    else
      object.all_moves()

  find_moves: () ->
    buffer = []
    i = 0
    for row in @rows
      j = 0
      for object in row
        for move in @consider object
          buffer.push move
        j++
      i++
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
