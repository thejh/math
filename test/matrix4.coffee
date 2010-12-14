require('../lib/math').extend Math

vows = require 'vows'
assert = require 'assert'
require './helpers'

vows.describe('Math.Matrix4').addBatch(
  'perspective':
    topic: Math.Matrix4
    
    'should generate a correct perspective matrix': (Matrix4) ->
      ok = [1.8106601238250732,0,0,0,0,2.4142136573791504,0,0,0,0,-1.0202020406723022,-1,0,0,-2.0202019214630127,0]
      
      m = Matrix4.create()
      Matrix4.perspective 45, 4/3, 1, 100, m
      
      assert.matchesMatrix ok, m
).export module