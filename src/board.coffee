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
    @rows = []
    @state = 'playing'
    @player = 'w'

  setup_backrow: (color) ->
    row = []
    row.push new Rook   color, @
    row.push new Knight color, @
    row.push new Bishop color, @
    row.push new King   color, @
    row.push new Queen  color, @
    row.push new Bishop color, @
    row.push new Knight color, @
    row.push new Rook   color, @
    @rows.push row

  setup_pawns: (color) ->
    row = []
    for i in [1..8]
      row.push new Pawn color, @
    @rows.push row

  setup_empties: () ->
    for i in [1..4]
      row = []
      for j in [1..8]
        row.push new Empty()
      @rows.push row

  init: (done) ->
    @setup_backrow 'b'
    @setup_pawns 'b'
    @setup_empties()
    @setup_pawns 'w'
    @setup_backrow 'w'

    # give each piece it's i,j coords
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
    e = new Empty()
    e.i = move.from.i
    e.j = move.from.j
    p = @rows[move.from.i][move.from.j]
    p.i = move.to.i
    p.j = move.to.j
    @rows[move.from.i][move.from.j] = e
    @rows[move.to.i][move.to.j] = p

    if p instanceof Pawn
      p.first_move = false

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

  to_s: () ->
    console.log ''
    i = 0
    for row in @rows
      j = 0
      temp = []
      for object in row
        temp.push object.to_s()
        j++
      console.log temp.join(' , ')
      i++
    console.log ''

