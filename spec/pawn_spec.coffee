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
  it 'pawn should move 1 or 2 space', (done) ->
    pawn = board.rows[6][0]
    moves = pawn.all_moves()
    expect(moves[0].to_s()).toEqual '6,0 5,0'
    expect(moves[1].to_s()).toEqual '6,0 4,0'
    done()
