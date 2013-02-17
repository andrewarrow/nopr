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
  it 'should return all css files', (done) ->
    SpecHelper.http '/assets/application.css', (text) ->
      expect(code).toEqual(200)
      done()
