{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'
{Move} = require './../src/move'
{Cords} = require './../src/cords'
_ = require 'underscore'

describe 'server', ->
  an = undefined
  beforeEach (done) ->
    board = new Board()
    board.init 1
    an = new An(board)
    done()
  afterEach (done) ->
    done()
  it 'a pawn location should find the right pawn and move it', (done) ->
    piece = an.find_piece 'e4'
    expect(piece.to_s()).toEqual('wp')
    done()
