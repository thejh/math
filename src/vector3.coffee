Vector3 =
  create: (args) ->
    v = new Math.ARRAY_TYPE args or 3
    
    v.__defineGetter__ 'x', -> @[0]
    v.__defineGetter__ 'y', -> @[1]
    v.__defineGetter__ 'z', -> @[2]
    
    v.__defineSetter__ 'x', (value) -> @[0] = value
    v.__defineSetter__ 'y', (value) -> @[1] = value
    v.__defineSetter__ 'z', (value) -> @[2] = value
    
    return v

  set: (v, out) ->
    out[0] = v[0]
    out[1] = v[1]
    out[2] = v[2]

    return v

  add: (a, b, out) ->
    if not out or a is out
      a[0] += b[0]
      a[1] += b[1]
      a[2] += b[2]

      return a

    out[0] = a[0] + b[0]
    out[1] = a[1] + b[1]
    out[2] = a[2] + b[2]

    return out

  subtract: (a, b, out) ->
    if not out or a is out
      a[0] -= b[0]
      a[1] -= b[1]
      a[2] -= b[2]

      return a

    out[0] = a[0] - b[0]
    out[1] = a[1] - b[1]
    out[2] = a[2] - b[2]
    return out

  negate: (v, out) ->
    out = v unless out

    out[0] = -v[0]
    out[1] = -v[1]
    out[2] = -v[2]

    return out

  scale: (v, k, out) ->
    if not out or v is out
      v[0] *= k
      v[1] *= k
      v[2] *= k

      return v

    out[0] = v[0] * k
    out[1] = v[1] * k
    out[2] = v[2] * k

    return out

  normalize: (v, out) ->
    out = v unless out

    x = v[0]
    y = v[1]
    z = v[2]

    magnitude = Math.sqrt x * x + y * y + z * z

    unless magnitude
      out[0] = 0
      out[1] = 0
      out[2] = 0
      
      return out

    else if magnitude is 1
      out[0] = x
      out[1] = y
      out[2] = z
      
      return out

    magnitude = 1 / magnitude

    out[0] = x * magnitude
    out[1] = y * magnitude
    out[2] = z * magnitude

    return out

  cross: (a, b, out) ->
    out = v unless out

    a_x = a[0]
    a_y = a[1]
    a_z = a[2]

    b_x = b[0]
    b_y = b[1]
    b_z = b[2]

    out[0] = a_y * b_z - a_z * b_y
    out[1] = a_z * b_x - a_x * b_z
    out[2] = a_x * b_y - a_y * b_x

    return out

  length: (v) ->
    x = v[0]
    y = v[1]
    z = v[2]

    return Math.sqrt x * x + y * y + z * z

  dot: (a, b) ->
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]

  direction: (a, b, out) ->
    out = a unless out

    x = a[0] - b[0]
    y = a[1] - b[1]
    z = a[2] - b[2]

    magnitude = Math.sqrt x * x + y * y + z * z

    unless magnitude
      out[0] = 0
      out[1] = 0
      out[2] = 0
      return out

    magnitude = 1 / magnitude

    out[0] = x * magnitude
    out[1] = y * magnitude
    out[2] = z * magnitude

    return out
    
if module?.exports? then module.exports = Vector3 else @Math.Vector3 = Vector3