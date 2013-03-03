{BasePiece} = require './base_piece'
{Move}      = require './move'

class exports.An
  constructor: (@board) ->

  move_by_an: (an) ->
    an = an.trim()
    # 1. e4 d6
    # 2. d4 Nf6
    # 3. Nc3 g6
    # 4. Be3 Bg7
    # 5. Qd2 c6
    # 6. f3 b5
    # 7. Nge2 Nbd7
    # 8. Bh6 Bxh6
    # 9. Qxh6 Bb7
    # 10. a3 e5

    letters = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7}
    numbers = {'1': 7, '2': 6, '3': 5, '4': 4, '5': 3, '6': 2, '7': 1, '8': 0}
 
    i = undefined
    j = undefined
    console.log 'fred', an.length
    if an.length == 2
      console.log 'fred', an[1],an[0]
      i = numbers[an[1]]
      j = letters[an[0]]
    else if an.length == 3
      i = numbers[an[2]]
      j = letters[an[1]]
      # an[0] piece
    else if an.length == 4
      i = numbers[an[3]]
      j = letters[an[2]]
      # an[0] piece
      if an[1] == 'x'
      else
        # an[1] at col
    else if an.length == 5
      # Nbxd5
      i = numbers[an[4]]
      j = letters[an[3]]
      # an[0] piece
      # an[1] at col
    console.log 'fred', i, j

