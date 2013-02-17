{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'
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
      there = false
      board.find_moves (res) ->
        there = _.contains res, [{fr: 0, fc: 1, tr: 1, tc: 1 }]
      expect(there).toEqual(true)
      done()
  it 'should find all moves for other player', (done) ->
      there = false
      board.player = 'b'
      board.find_moves (res) ->
        there = _.contains res, [{fr: 0, fc: 1, tr: 1, tc: 1 }]
      expect(there).toEqual(true)
      done()
  ###
  it 'should be in state finished', (done) ->
      done()
  it 'should be in state playing', (done) ->
      expect(board.state).toEqual('playing')
      done()
