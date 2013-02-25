{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'
{Move} = require './../src/move'
{Empty} = require './../src/empty'
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
  it 'when in check must move out', (done) ->
    sq = board.rows[7][3]
    board.rows[3][3] = sq
    e = new Empty()
    e.i = 7
    e.j = 3
    board.rows[7][3] = e
    sq.i = 3
    sq.j = 3
    sq = board.rows[3][3]
    board.toggle_player()

    sq = board.rows[1][2]
    moves = sq.all_moves()
    board.move moves[0]

    sq = board.rows[6][0]
    moves = sq.all_moves()
    board.move moves[0]
    expect(board.rows[6][0].empty()).toEqual(false)
    done()
  it 'cannot move into check', (done) ->
    sq = board.rows[7][3]
    board.rows[3][3] = sq
    e = new Empty()
    e.i = 7
    e.j = 3
    board.rows[7][3] = e
    sq.i = 3
    sq.j = 3
    sq = board.rows[3][3]

    moves = sq.all_moves()
    board.move moves[0]
    expect(board.player).toEqual('w')
    done()
