{SpecHelper} = require './spec_helper'
{Board} = require './../src/board'

describe 'server', ->
  board = undefined
  beforeEach (done) ->
    board = new Board()
    board.init () ->
      done()
  afterEach (done) ->
    done()
  it 'should be in state playing', (done) ->
      expect(board.state).toEqual('playing')
      done()
  it 'should find all moves for current player', (done) ->
      board.find_moves (res) ->
        expect(res).toEqual([{fr: 0, fc: 1, tr: 1, tc: 1 }])
      done()
  it 'should be in state finished', (done) ->
      done()
