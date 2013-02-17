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

  init: (done) ->
    done()

  look_n: (i, j) ->
    if @player == 'w'
      @rows[i-1][j]
    else
      @rows[i+1][j]

  look_ne: (i, j) ->
    ''
  look_nw: (i, j) ->
    ''

  move_as_r: (i, j, done) ->
    done([])
  move_as_h: (i, j, done) ->
    done([])
  move_as_b: (i, j, done) ->
    done([])
  move_as_k: (i, j, done) ->
    done([])
  move_as_q: (i, j, done) ->
    done([])
  move_as_p: (i, j, done) ->
    sq=@look_n(i, j)
    sq=@look_ne(i, j)
    sq=@look_nw(i, j)
    done([])

  consider_sq: (i, j, sq, done) ->
    options = []
    color = sq[0]
    type = sq[1]
    
    if color == undefined or color != @player
       done([])
       return
     else
      @["move_as_#{type}"] i, j, (options) ->
        console.log i, j, color, type, options
        done(options)
        return


  white_peices: (done) ->
    i = 0
    for row in @rows
      i++
      j = 0
      for sq in row
        j++
        @consider_sq i, j, sq, (options) ->

    done('')

  find_moves: (done) ->
    wp = @white_peices (res) ->
      moves = []
      moves[0] = []
      done(moves)
