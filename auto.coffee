{Board}  = require './src/board'

count = 0
do_loop = () ->
  for i in [1..100]
    console.log 'fred', i
  count++
  console.log 'fredc', count
  if count > 100
    process.exit 1

setInterval do_loop, 100



###
while true

  board = new Board()
  board.init()

  count = 0
  while true
    moves = board.find_moves 1
    if moves.length == 0
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
    if count == 100
      board.to_s 1
      #console.log 'fred', board.count_pieces()
      break

