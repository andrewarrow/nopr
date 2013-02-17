{SpecHelper} = require './spec_helper'

describe 'server', ->
  beforeEach (done) ->
    SpecHelper.start()
    done()
  afterEach (done) ->
    SpecHelper.stop()
    done()
  it 'should return 200 OK', (done) ->
    SpecHelper.http '/', (code) ->
      expect(code).toEqual(200)
      done()
