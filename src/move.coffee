class exports.Move
  constructor: (@from, @to) ->

  equals: (move) ->
    @from.equals(move.from) and @to.equals(move.to)

  to_p: () ->
    "#{@from.to_s()},#{@to.to_s()}"

  to_s: () ->
    "#{@from.i},#{@from.j} #{@to.i},#{@to.j}"

  
