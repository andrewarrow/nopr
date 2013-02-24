class exports.Move
  constructor: (from, to) ->
    @from = {i: from.i, j: from.j}
    @to = {i: to.i, j: to.j}

  equals: (move) ->
    @from.equals(move.from) and @to.equals(move.to)

  to_p: () ->
    "#{@from.to_s()},#{@to.to_s()}"

  to_s: () ->
    "#{@from.i},#{@from.j} #{@to.i},#{@to.j}"

  
