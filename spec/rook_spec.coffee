{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'
{Move} = require './../src/move'
{Cords} = require './../src/cords'
_ = require 'underscore'

describe 'server', ->
  board = undefined
  beforeEach (done) ->
    board = new Board()
    board.init 1
    done()
  afterEach (done) ->
    done()
  it 'rook should not jump over pieces', (done) ->
    rook = board.rows[7][0]
    moves = rook.all_moves()
    expect(moves.length).toEqual(0)
    done()
  it 'rook should move 1 or 2 spaces', (done) ->
    pawn = board.rows[6][0]
    moves = pawn.all_moves()
    board.move(moves[1])

    rook = board.rows[7][0]
    moves = rook.all_moves()
    expect(moves.length).toEqual(2)
    done()
