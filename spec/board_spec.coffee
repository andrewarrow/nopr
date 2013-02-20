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
  it 'should find all moves for current player', (done) ->
    cords = new Cords('  ', 5, 0, 'w')
    a_move = board.create_move(6, 0, cords)
    
    result = _.find board.find_moves(), (move) ->
      move.equals(a_move)

    expect(result == undefined).toEqual(false)
    done()
