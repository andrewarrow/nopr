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
  it 'should have all pieces setup for a new game', (done) ->
    board.to_s()
    done()
