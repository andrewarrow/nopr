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

    # 8
    # 7
    # 6
    # 5
    # 4
    # 3
    # 2
    # 1
    #  ABCDEFGH

    @grid = {}
    for i in [1..8]
      for letter in 'abcdefgh'
        @grid[letter+i] = new Empty()

  setup_backrow: (color) ->
    row = '8'
    row = '1' if color == 'w'
    @grid['a'+row] = new Rook   color
    @grid['b'+row] = new Knight color
    @grid['c'+row] = new Bishop color
    @grid['d'+row] = new King   color
    @grid['e'+row] = new Queen  color
    @grid['f'+row] = new Bishop color
    @grid['g'+row] = new Knight color
    @grid['h'+row] = new Rook   color

  setup_pawns: (color) ->
    row = '7'
    row = '2' if color == 'w'
    for letter in 'abcdefgh'
      @grid[letter+row] = new Pawn color

  init: () ->
    @setup_backrow 'b'
    @setup_pawns 'b'
    @setup_pawns 'w'
    @setup_backrow 'w'

  count_pieces_by_color: (color) ->
    count = 0
    for row in @rows
      for object in row
        count++ if object.friend(color)
    count

  count_pieces: () ->
    count = 0
    for row in @rows
      for object in row
        count++ if object.empty()
    64 - count

  find_other_king: () ->
    colors = {w: 'b', b: 'w'}
    color = colors[@player]

    for row in @rows
      for object in row
        sq = object.to_s()
        if sq[0] == color and sq[1] == 'k'
          return object

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

  get_piece: (c) ->
    @rows[c.i][c.j]

  put_piece: (piece, c) ->
    @rows[c.i][c.j] = piece
    piece.i = c.i
    piece.j = c.j

  move: (move) ->
    lucky_pawn = undefined

    p = @get_piece move.from
    @put_piece new Empty(), move.from
    taken = @get_piece move.to
    @put_piece p, move.to

    if p instanceof Pawn
      p.first_move = false
      if @player == 'w' and p.i == 0
        lucky_pawn = p
        @put_piece new Queen('w', @), p
      else if @player == 'b' and p.i == 7
        lucky_pawn = p
        @put_piece new Queen('b', @), p

    #if @can_take_king 1
    #  console.log 'yo, u in check'

    @toggle_player 1

    if @can_take_king 1
      @put_piece p, move.from
      @put_piece taken, move.to

      if p instanceof Pawn
        p.first_move = true
        if lucky_pawn != undefined
          @put_piece lucky_pawn, p

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
    for i in [8..1]
      temp = []
      for letter in 'abcdefgh'
        temp.unshift @grid[letter+i].to_s()
      console.log i + ' | ' + temp.join(' , ')

    console.log '    ------------------------------------'
    console.log '    a    b    c    d    e    f    g    h'
    console.log ''

