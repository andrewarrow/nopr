class exports.Pawn
  constructor: (@board, @first_move) ->

  all_moves: (i, j, done) ->
    options = []
    @board.look_n i, j, (cord) =>
      console.log 'e: ', i, j, cord
      if cord.sq == '' and cord.sq != undefined
        console.log 'fre1', cord
        options.push [cord.i, cord.j]
      @board.look_n (cord.i), j, (cord) =>
        console.log 'e: ', i, j, cord
        if cord.sq == '' and cord.sq != undefined and @first_move
          console.log 'fre2', cord
          options.push [cord.i, cord.j]
        @board.look_ne i, j, (cord) =>
          if cord.sq != '' and cord.sq != undefined
            console.log 'fre3', cord
            options.push [cord.i, cord.j]
          @board.look_nw i, j, (cord) ->
            if cord.sq != '' and cord.sq != undefined
              console.log 'fre4', cord
              options.push [cord.i, cord.j]
            done(options)
