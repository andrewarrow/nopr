class exports.Move
  constructor: (@from, @to) ->

  equals: (move) ->
    @from.equals(move.from) and @to.equals(move.to)


  
