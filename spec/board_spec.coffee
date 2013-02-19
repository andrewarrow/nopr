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
    cords = new Cords('wp', 0, 0)
    m1 = board.create_move(0, 0, cords)
    m2 = board.create_move(0, 0, cords)
    console.log m1.equals m2
    done()
  ###
  it 'should find all moves for current player', (done) ->
      there = false
      moves = board.find_moves()
      for move in moves
        console.log 'fred', move
      #    if set.fr == 6 and set.fc == 0 and set.tr == 5 and set.tc == 0
      expect(there).toEqual(true)
      done()
  it 'should find all moves for other player', (done) ->
      there = false
      board.player = 'b'
      board.find_moves (res) ->
        there = _.contains res, [{fr: 1, fc: 0, tr: 2, tc: 0 }]
      expect(there).toEqual(true)
      done()
  it 'should be in state finished', (done) ->
      done()
  it 'should be in state playing', (done) ->
      expect(board.state).toEqual('playing')
      done()
