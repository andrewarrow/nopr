{SpecHelper} = require './spec_helper'
{ChessBoard} = require './../src/chess_board'
{Move} = require './../src/move'
{Cords} = require './../src/cords'
_ = require 'underscore'

describe 'server', ->
  board = undefined
  beforeEach (done) ->
    board = new ChessBoard()
    board.init 1
    done()
  afterEach (done) ->
    done()
  it 'should have all pieces setup for a new game', (done) ->
    board.to_s()
    done()
  it 'looks in one direction and returns how far it got', (done) ->
    result = board.look_from 'e4', 'south'
    expect(result.row).toEqual 2
    done()
###
  it 'should find piece from an', (done) ->
    piece = board.find_by_an 'e4'
    console.log 'fred', piece
    done()
