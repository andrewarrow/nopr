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
    board.init 1
  afterEach (done) ->
    done()
  it 'pawn become a queen', (done) ->
    board.put_piece new Empty(), {i:0,j:2}
    board.put_piece new Empty(), {i:1,j:2}

    pawn = board.get_piece {i:6,j:2}
    board.put_piece new Empty(), {i:6,j:2}
    board.put_piece pawn, {i:1,j:2}

    moves = pawn.all_moves 1
    board.move moves[0]
    expect(board.get_piece(i:0,j:2).to_s()).toEqual 'wq'
    done()
  it 'pawn become a queen and then undo', (done) ->
    board.put_piece new Empty(), {i:0,j:2}
    board.put_piece new Empty(), {i:1,j:2}

    pawn = board.get_piece {i:6,j:2}
    board.put_piece new Empty(), {i:6,j:2}
    board.put_piece pawn, {i:1,j:2}

    moves = pawn.all_moves 1
    orig = board.can_take_king
    board.can_take_king = () ->
      true
    board.move moves[0]
    board.can_take_king = orig
    expect(board.get_piece(i:1,j:2).to_s()).toEqual 'wp'
    done()
  it 'pawn should move 1 or 2 space', (done) ->
    pawn = board.rows[6][0]
    moves = pawn.all_moves()
    expect(moves[0].to_s()).toEqual '6,0 5,0'
    expect(moves[1].to_s()).toEqual '6,0 4,0'
    done()
  describe 'after a pawn moved 2 spaces', ->
    pawn = undefined
    beforeEach (done) ->
      pawn = board.rows[6][0]
      moves = pawn.all_moves()
      board.move moves[1]
      done()
    afterEach (done) ->
      done()
    it 'pawn should move 1 space', (done) ->
      expect(pawn.first_move).toEqual false
      moves = pawn.all_moves()
      expect(moves[0].to_s()).toEqual '4,0 3,0'
      expect(moves.length).toEqual 1
      done()
    it 'pawn should attack a piece north east', (done) ->
      pawn = board.rows[1][1]
      moves = pawn.all_moves()
      board.move moves[1]
      pawn = board.rows[4][0]
      moves = pawn.all_moves()
      board.move moves[1]
      new_pawn = board.rows[3][1]
      expect(new_pawn.color).toEqual 'w'
      done()
