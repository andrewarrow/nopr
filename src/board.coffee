{Pawn} = require './../src/pawn'

class exports.Board
  constructor: () ->
    @rows = [
      ['br','bh','bb','bk','bq','bb','bh','br'],
      ['bp','bp','bp','bp','bp','bp','bp','bp'],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['','','','','','','',''],
      ['wp','wp','wp','wp','wp','wp','wp','wp'],
      ['wr','wh','wb','wq','wk','wb','wh','wr']]

    @state = 'playing'
    @player = 'w'
    @p = {}

  init: (done) ->
    @p['r'] = new Pawn(@, false)
    @p['h'] = new Pawn(@, false)
    @p['b'] = new Pawn(@, false)
    @p['k'] = new Pawn(@, false)
    @p['q'] = new Pawn(@, false)
    @p['p'] = new Pawn(@, true)
    done()

  look_n: (i, j, far, done) ->
    if @player == 'w'
      done({sq: @rows[i-1][j], i: i-1, j: j})
    else
      done({sq: @rows[i+1][j], i: i+1, j: j})
  look_ne: (i, j, far, done) ->
    if @player == 'w'
      done({sq: @rows[i-1][j+1], i: i-1, j: j+1})
    else
      done({sq: @rows[i+1][j-1], i: i+1, j: j-1})
  look_nw: (i, j, far, done) ->
    if @player == 'w'
      done({sq: @rows[i-1][j-1], i: i-1, j: j-1})
    else
      done({sq: @rows[i+1][j+1], i: i+1, j: j+1})

  consider_sq: (i, j, sq, done) ->
    options = []
    color = sq[0]
    type = sq[1]
    
    if color == undefined or color != @player
       done([])
       return
     else
      @p[type].all_moves i, j, (options) ->
        console.log i, j, color, type, options
        done(options)
        return

  white_peices: (done) ->
    i = 0
    for row in @rows
      j = 0
      for sq in row
        @consider_sq i, j, sq, (options) ->
        j++
      i++

    done('')

  find_moves: (done) ->
    wp = @white_peices (res) ->
      moves = []
      moves[0] = []
      done(moves)
