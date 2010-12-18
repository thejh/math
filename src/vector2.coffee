Vector2 =
  create: (args) ->
    v = new Math.ARRAY_TYPE args or 2
    
    v.__defineGetter__ 'x', -> @[0]
    v.__defineGetter__ 'y', -> @[1]
    
    v.__defineSetter__ 'x', (value) -> @[0] = value
    v.__defineSetter__ 'y', (value) -> @[1] = value
    
    return v
    
  set: (v, out) ->
    out[0] = v[0]
    out[1] = v[1]

    return v

  add: (a, b, out) ->
    if not out or a is out
      a[0] += b[0]
      a[1] += b[1]

      return a

    out[0] = a[0] + b[0]
    out[1] = a[1] + b[1]

    return out

  subtract: (a, b, out) ->
    if not out or a is out
      a[0] -= b[0]
      a[1] -= b[1]

      return a

    out[0] = a[0] - b[0]
    out[1] = a[1] - b[1]
    
    return out

  negate: (v, out) ->
    out = v unless out

    out[0] = -v[0]
    out[1] = -v[1]

    return out

  scale: (v, k, out) ->
    if not out or v is out
      v[0] *= k
      v[1] *= k

      return v

    out[0] = v[0] * k
    out[1] = v[1] * k

    return out

  normalize: (v, out) ->
    out = v unless out

    x = v[0]
    y = v[1]

    magnitude = Math.sqrt x * x + y * y

    if !magnitude
      out[0] = 0
      out[1] = 0
      return out

    else if magnitude is 1
      out[0] = x
      out[1] = y
      return out

    magnitude = 1 / magnitude

    out[0] = x * magnitude
    out[1] = y * magnitude

    return out

  length: (v) ->
    x = v[0]
    y = v[1]

    return Math.sqrt x * x + y * y

  dot: (a, b) ->
    a[0] * b[0] + a[1] * b[1]

  direction: (a, b, out) ->
    out = a unless out

    x = a[0] - b[0]
    y = a[1] - b[1]

    magnitude = Math.sqrt x * x + y * y

    unless magnitude
      out[0] = 0
      out[1] = 0
      return out

    magnitude = 1 / magnitude

    out[0] = x * magnitude
    out[1] = y * magnitude

    return out
    
if module?.exports? then module.exports = Vector2 else @Math.Vector2 = Vector2