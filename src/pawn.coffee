class exports.Pawn
  constructor: (@board, @first_move) ->

  all_moves: (i, j, done) ->
    options = []
    @board.look_n i, j, 1, (cord) =>
      if cord.sq == '' and cord.sq != undefined
        options.push [cord.i, cord.j]
      @board.look_n i, j, 2, (cord) =>
        if cord.sq == '' and cord.sq != undefined and @first_move
          options.push [cord.i, cord.j]
        @board.look_ne i, j, 1, (cord) =>
          if cord.sq != '' and cord.sq != undefined
            options.push [cord.i, cord.j]
          @board.look_nw i, j, 1, (cord) ->
            if cord.sq != '' and cord.sq != undefined
              options.push [cord.i, cord.j]
            done(options)
