{Board}  = require './src/board'

board = new Board()
board.init () ->
  board.to_s 1

  process.stdin.resume()
  process.stdin.setEncoding('ascii')

  process.stdin.on 'data', (txt) ->
    console.log '\n'
    moves = board.find_moves 1
    pick = Math.round(Math.random() * moves.length) - 1
    pick = 0 if pick < 0

    m = moves[pick]
    board.move m
    board.to_s 1

