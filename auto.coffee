{Board}  = require './src/board'

winner = false
board = new Board()
board.init () ->
  board.to_s 1

  count = 0
  while true
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
      board.move m
    count++
    if count % 1000
      console.log count

