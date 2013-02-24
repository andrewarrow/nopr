{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'
{Move} = require './../src/move'
{Cords} = require './../src/cords'
_ = require 'underscore'

describe 'server', ->
  board = undefined
  beforeEach (done) ->
    board = new Board()
    board.init () ->
      done()
  afterEach (done) ->
    done()
  it 'rook should not jump over pieces', (done) ->
    rook = board.rows[7][0]
    moves = rook.all_moves()
    for move in moves
      console.log move.to_s()
    done()
