{Board}  = require './src/board'

winner = false
board = new Board()
board.init 1
board.to_s 1

process.stdin.resume()
process.stdin.setEncoding('ascii')

process.stdin.on 'data', (txt) ->
  console.log '\n'

  board.move_by_an txt
  #board.move m
  #board.to_s 1

