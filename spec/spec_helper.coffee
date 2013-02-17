web = require 'http'
server = undefined

class exports.SpecHelper
  @create_board: () ->
    board = new Board()
 
  @start: () ->
  
