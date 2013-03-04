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
  it 'run a simple game', (done) ->
    board.move 'e4'
    board.move 'd6'
    board.move 'd4'
    board.move 'Nf6'
    board.to_s()
    done()
###
  it 'should find piece from an', (done) ->
    piece = board.find_by_an 'e4'
    console.log 'fred', piece
    done()
