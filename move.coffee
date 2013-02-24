{Board}  = require './src/board'

sq=undefined
board = new Board()
board.init () ->
  board.to_s 1
  sq = board.rows[6][4]
  moves = sq.all_moves 1
  board.move moves[1]
  board.to_s 1
  sq = board.rows[7][3]

  process.stdin.resume()
  process.stdin.setEncoding('ascii')

  process.stdin.on 'data', (txt) ->
    console.log '\n'
    moves = sq.all_moves 1
    pick = Math.round(Math.random() * moves.length) - 1
    pick = 0 if pick < 0

    m = moves[pick]
    board.move m
    sq = board.rows[m.to.i][m.to.j]
    board.to_s 1

