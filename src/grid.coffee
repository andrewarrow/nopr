{Cords}  = require './cords'
{Move}      = require './move'
{Empty}     = require './empty'
{Direction} = require './direction'

class exports.Grid
  constructor: (@max_letter, @max_row) ->
    @data = {}
    @npov = {}
    @npov.south = new Direction 0, 1
    @spov = {}
    @spov.south = new Direction 0, -1

  setup_board: () ->
    for letter in 'abcdefgh'
      for row in [1..@max_row]
        @set_sq letter, row, new Empty()

  set_sq: (letter, row, thing) ->
    thing.letter = letter
    thing.row = row
    @data[letter+row] = thing

  get_sq: (letter, row) ->
    @data[letter+row]

  look_from: (an, pov, direction_name) ->
    letter = an[0]
    row    = parseInt an[1]

    next = @[pov][direction_name].next_letter_and_row letter, row
    sq = @get_sq next.letter, next.row
    while (sq instanceof Empty) and (next.letter != 'j') and (next.row != 8)
      next = @[pov][direction_name].next_letter_and_row next.letter, next.row
      sq = @get_sq next.letter, next.row
    sq

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
