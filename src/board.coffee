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
    @p['r'] = new Pawn(@)
    @p['h'] = new Pawn(@)
    @p['b'] = new Pawn(@)
    @p['k'] = new Pawn(@)
    @p['q'] = new Pawn(@)
    @p['p'] = new Pawn(@)
    done()

  look_n: (i, j, done) ->
    if @player == 'w'
      done({sq: @rows[i-1][j], i: i-1, j: j})
    else
      done({sq: @rows[i+1][j], i: i+1, j: j})
  look_ne: (i, j, done) ->
    done({sq: '', i: i+1, j: j})
  look_nw: (i, j, done) ->
    done({sq: '', i: i+1, j: j})

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
