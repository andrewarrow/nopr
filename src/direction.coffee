{Pawn}   = require './pawn'
{Rook}   = require './rook'
{Knight} = require './knight'
{Bishop} = require './bishop'
{King}   = require './king'
{Queen}  = require './queen'
{Cords}  = require './cords'
{Move}   = require './move'
{Empty}  = require './empty'

class exports.Direction
  constructor: (@max_letter, @max_row) ->
    @data = {}

  @next_letter_and_row: (letter, row) ->
    {letter: letter, row: row+1}

