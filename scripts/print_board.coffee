{Board} = require '../src/board'

board = new Board()

process.stdin.resume()
process.stdin.setEncoding('ascii')

process.stdin.on 'data', (chunk) ->
  console.log '\n'
  console.log board.rows
  console.log '\n'

