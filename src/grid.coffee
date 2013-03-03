{Pawn}   = require './pawn'
{Rook}   = require './rook'
{Knight} = require './knight'
{Bishop} = require './bishop'
{King}   = require './king'
{Queen}  = require './queen'
{Cords}  = require './cords'
{Move}   = require './move'
{Empty}  = require './empty'

class exports.Grid
  constructor: (@max_letter, @max_row) ->
    @data = {}

  setup_board: () ->
    for letter in 'abcdefgh'
      for row in [1..@max_row]
        @set_sq letter, row, new Empty()

  set_sq: (letter, row, thing) ->
    @data[letter+row] = thing

  get_sq: (letter, row) ->
    @data[letter+row]

  look_from: (an, direction) ->
    letter = an[0]
    row    = an[1]

    @get_sq direction.next_letter_and_row letter, row

  to_s: () ->
    console.log ''
    for row in [@max_row..1]
      temp = []
      for letter in 'abcdefgh'
        thing = @get_sq letter, row
        temp.unshift thing.to_s()
      console.log row + ' | ' + temp.join(' , ')

    console.log '    ------------------------------------'
    console.log '    a    b    c    d    e    f    g    h'
    console.log ''
