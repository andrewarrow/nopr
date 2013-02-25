{Board}  = require '../src/board'

board = new Board()
board.init 1
board.print_board()

process.stdin.resume()
process.stdin.setEncoding('ascii')

process.stdin.on 'data', (txt) ->
  console.log '\n'

  moves = board.find_moves()
  pick = Math.round(Math.random() * moves.length) - 1
  pick = 0 if pick < 0

  console.log 'player : ' + board.player
  console.log 'moves  : ' + moves.length
  for move in moves
    console.log move.from.to_s(), move.to.to_s(), move.from.i, move.from.j, '   ', move.to.i, move.to.j

  board.move(moves[pick])
  board.print_board()

