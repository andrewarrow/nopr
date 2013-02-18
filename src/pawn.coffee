class exports.Pawn
  constructor: (@board) ->
    @first_move = true

  all_moves: (i, j, done) ->
    options = []
    @board.look_n i, j, (cord) =>
      if cord.sq == '' and cord.sq != undefined
        options.push {fr: i, fc: j, tr: cord.i, tc: cord.j}
      @board.look_n (cord.i), j, (cord) =>
        if cord.sq == '' and cord.sq != undefined and @first_move
          options.push {fr: i, fc: j, tr: cord.i, tc: cord.j}
        @board.look_ne i, j, (cord) =>
          if cord.sq != '' and cord.sq != undefined
            options.push {fr: i, fc: j, tr: cord.i, tc: cord.j}
          @board.look_nw i, j, (cord) ->
            if cord.sq != '' and cord.sq != undefined
              options.push {fr: i, fc: j, tr: cord.i, tc: cord.j}
            done(options)
