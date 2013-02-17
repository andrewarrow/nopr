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
    @player = 'white'

  init: (done) ->
    done()

  consider_sq: (sq, done) ->
    options = []
    if sq != ''
      options.push [1,2,3]
    done(options)

  white_peices: (done) ->
    for row in @rows
      console.log '  fred', row
      for sq in row
        @consider_sq sq, (options) ->
          console.log 'fred', options

    done('')

  find_moves: (done) ->
    wp = @white_peices (res) ->
      moves = []
      moves[0] = []
      done(moves)
