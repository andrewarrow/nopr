{Board}  = require './src/board'

winner = false
board = new Board()
board.init 1
board.to_s 1

process.stdin.resume()
process.stdin.setEncoding('ascii')

process.stdin.on 'data', (txt) ->
  console.log '\n'
  moves = board.find_moves 1
  if moves.length == 0
    winner = true
    console.log '\n'
    console.log 'WINNER'
    console.log '\n'
    process.exit 1
  else
    pick = Math.round(Math.random() * moves.length) - 1
    pick = 0 if pick < 0

    m = moves[pick]
    console.log board.player, 'move', board.rows[m.from.i][m.from.j].to_s(), m.to.i, m.to.j
    board.move m
    board.to_s 1

