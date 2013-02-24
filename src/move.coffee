class exports.Move
  constructor: (from, to) ->
    @from = {i: from.i, j: from.j}
    @to = {i: to.i, j: to.j}

  equals: (move) ->
    @from.equals(move.from) and @to.equals(move.to)

  to_p: () ->
    "#{@from.to_s()},#{@to.to_s()}"

  to_s: () ->
    console.log '2222', "#{@from.i},#{@from.j} #{@to.i},#{@to.j}"
    "#{@from.i},#{@from.j} #{@to.i},#{@to.j}"

  
