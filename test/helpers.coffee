assert = require 'assert'

assert.matchesMatrix = (a, b) ->
  EPSILON = 0.0000001
  for i in [0...16]
    actual = a[i]
    expected = b[i]
    if Math.abs(actual - expected) > EPSILON
      assert.fail actual, expected, 'expected {actual} to match {expected}', 'matchesMatrix', assert.matchesMatrix