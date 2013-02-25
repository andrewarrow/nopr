{Board}  = require './src/board'
      
do_outer_loop = () ->

  board = new Board()
  board.init()

  count = 0
  id = undefined
  do_loop = () ->
    moves = board.find_moves 1
    if moves.length == 0
      console.log '\n\n\n =================== WINNER ==========================='
    else
      pick = Math.round(Math.random() * moves.length) - 1
      pick = 0 if pick < 0

      m = moves[pick]
      board.move m
      board.to_s 1
      console.log count, board.count_pieces_by_color('w'), board.count_pieces_by_color('b')
    count++
    if count > 80
      console.log '\n\n\n =================== WINNER ==========================='
      clearInterval(id)
      do_outer_loop()

  id = setInterval do_loop, 100
      
do_outer_loop()

