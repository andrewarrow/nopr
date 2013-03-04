{Pawn}   = require './pawn'
{Rook}   = require './rook'
{Knight} = require './knight'
{Bishop} = require './bishop'
{King}   = require './king'
{Queen}  = require './queen'
{Cords}  = require './cords'
{Move}   = require './move'
{Empty}  = require './empty'
{Grid}   = require './grid'

class exports.ChessBoard extends Grid
  constructor: () ->
    super 'h', 8
    @state = 'playing'
    @player = 'w'

  setup_backrow: (color) ->
    colors = {w: 1, b: 8}
    row = colors[color]
    @set_sq 'a', row, new Rook   color, @
    @set_sq 'a', row, new Rook   color, @
    @set_sq 'b', row, new Knight color, @
    @set_sq 'c' ,row, new Bishop color, @
    @set_sq 'd', row, new King   color, @
    @set_sq 'e', row, new Queen  color, @
    @set_sq 'f', row, new Bishop color, @
    @set_sq 'g', row, new Knight color, @
    @set_sq 'h', row, new Rook   color, @

  setup_pawns: (color) ->
    colors = {w: 2, b: 7}
    for letter in 'abcdefgh'
      @set_sq letter, colors[color], new Pawn color, @

  init: () ->
    @setup_board()
    @setup_backrow 'b'
    @setup_pawns 'b'
    @setup_pawns 'w'
    @setup_backrow 'w'

  look_from: (anp, direction_name) ->
    colors = {w: 'spov', b: 'npov'}
    super anp.letter, anp.row, colors[@player], direction_name

  parse_an: (an) ->
    if an.length == 2
      letter = an[0]
      row    = parseInt an[1]
      {letter: letter, row: row, length: an.length}
    else if an.length == 3
      piece  = an[0]
      letter = an[1]
      row    = parseInt an[2]
      {letter: letter, row: row, length: an.length}

  toggle_player: () ->
    colors = {w: 'b', b: 'w'}
    @player = colors[@player]

  move: (an) ->
    anp = @parse_an an
    if anp.length == 2
      result = @look_from anp, 'south'
      super result, anp.letter, anp.row
    else if anp.length == 3
      # only one N could move to letter, row, find it
      results = Knight.moves_from anp.letter, anp.row
      console.log 'fred', results
      # find the black knight on this file
      # or find the black knight on this rank
      # or find the black knight at this file & rank

    @toggle_player()

###

rank = row
file = letter

If the piece is sufficient to unambiguously determine the origin square, the whole from square is omitted. Otherwise, if two (or more) pieces of the same kind can move to the same square, the piece's initial is followed by (in descending order of preference)
 file of departure if different
 rank of departure if the files are the same but the ranks differ
 the complete origin square coordinate otherwise

Nbd4
N1d4     only if the files are the same
Nb1d4    only if the ranks do not differ
Nb1xd4

<SAN move descriptor piece moves>   ::= <Piece symbol>[<from file>|<from rank>|<from square>]['x']<to square>
<SAN move descriptor pawn captures> ::= <from file>[<from rank>] 'x' <to square>[<promoted to>]
<SAN move descriptor pawn push>     ::= <to square>[<promoted to>]
