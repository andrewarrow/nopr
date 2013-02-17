class exports.Pawn
  constructor: (@board) ->

  all_moves: (i, j, done) ->
    options = []
    @board.look_n i, j, (cord) =>
      if cord.sq == ''
        options.push [cord.i,cord.j]
      @board.look_ne i, j, (cord) =>
        if cord.sq != ''
          options.push [cord.i,cord.j]
        @board.look_nw i, j, (cord) ->
          if cord.sq != ''
            options.push [cord.i,cord.j]
          done(options)
