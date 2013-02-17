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

  move_as_r: (done) ->
    done([])
  move_as_h: (done) ->
    done([])
  move_as_b: (done) ->
    done([])
  move_as_k: (done) ->
    done([])
  move_as_q: (done) ->
    done([])
  move_as_p: (done) ->
    done([])

  consider_sq: (sq, done) ->
    options = []
    color = sq[0]
    type = sq[1]
    
    if color == undefined or color != @player
      done([])
      return
     else
      @["move_as_#{type}"] (options) ->
        console.log color, type, options
        done(options)
        return


  white_peices: (done) ->
    for row in @rows
      for sq in row
        @consider_sq sq, (options) ->

    done('')

  find_moves: (done) ->
    wp = @white_peices (res) ->
      moves = []
      moves[0] = []
      done(moves)
