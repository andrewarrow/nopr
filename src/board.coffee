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
    if @player == 'w'
      done({sq: @rows[i-1][j+1], i: i-1, j: j+1})
    else
      done({sq: @rows[i+1][j-1], i: i+1, j: j-1})
  look_nw: (i, j, done) ->
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
    else
      @p[type].all_moves i, j, (options) ->
        done(options)

  find_moves: (done) ->
    #there = _.contains res, [{fr: 7, fc: 0, tr: 6, tc: 0 }]
    buffer = []
      
    do_loop = (i, j) =>
      if i == 8
        done(buffer)
      else
        if j == 8
          do_loop i+1, 0
        else
          sq = @rows[i][j]
          @consider_sq i, j, sq, (options) ->
            buffer.push options
            do_loop i, j+1

    do_loop 0, 0
