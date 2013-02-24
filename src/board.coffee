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

  find_other_king: () ->
    color = 'b'
    color = 'w' if @player == 'b'

    for row in @rows
      for object in row
        sq = object.to_s()
        if sq[0] == color and sq[1] == 'k'
          return sq

  can_take_king: () ->
    king = @find_other_king 1
    moves = @find_moves 1
    for move in moves
      if move.to.i == king.i and move.to.j == king.j
        return true
    return false

  toggle_player: () ->
    colors = {w: 'b', b: 'w'}
    @player = colors[@player]

  move: (move) ->
    e = new Empty()
    e.i = move.from.i
    e.j = move.from.j
    p = @rows[move.from.i][move.from.j]
    p.i = move.to.i
    p.j = move.to.j
    @rows[move.from.i][move.from.j] = e
    taken = @rows[move.to.i][move.to.j]
    @rows[move.to.i][move.to.j] = p

    if p instanceof Pawn
      p.first_move = false

    if @can_take_king 1
      console.log 'yo, u in check'

    @toggle_player 1

    if @can_take_king 1
      console.log 'fred back', 1
      @rows[move.from.i][move.from.j] = p
      p.i = move.from.i
      p.j = move.from.j
      @rows[move.to.i][move.to.j] = taken

      if p instanceof Pawn
        p.first_move = true

      @toggle_player 1


  consider: (object) ->
    if object.empty()
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

