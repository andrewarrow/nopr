{Board}  = require '../src/board'

board = new Board()
board.init () ->
  console.log '\n'
  console.log board.rows
  console.log '\n'

  process.stdin.resume()
  process.stdin.setEncoding('ascii')

  process.stdin.on 'data', (txt) ->
    console.log '\n'

    moves = board.find_moves()
    pick = Math.round(Math.random() * moves.length) - 1
    pick = 0 if pick < 0

    console.log 'player : ' + board.player
    console.log 'moves  : ' + moves.length
    if moves.length < 10
      console.log moves

    board.move(moves[pick])

    console.log board.rows

    console.log '\n'

