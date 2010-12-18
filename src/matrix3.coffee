Matrix3 =
  create: (args) ->
    m = new Math.ARRAY_TYPE args or 9
    
    m.__defineGetter__ 'm00', -> @[0]
    m.__defineGetter__ 'm01', -> @[1]
    m.__defineGetter__ 'm02', -> @[2]
    m.__defineGetter__ 'm10', -> @[3]
    m.__defineGetter__ 'm11', -> @[4]
    m.__defineGetter__ 'm12', -> @[5]
    m.__defineGetter__ 'm20', -> @[6]
    m.__defineGetter__ 'm21', -> @[7]
    m.__defineGetter__ 'm22', -> @[8]
    
    m.__defineSetter__ 'm00', (value) -> @[0] = value
    m.__defineSetter__ 'm01', (value) -> @[1] = value
    m.__defineSetter__ 'm02', (value) -> @[2] = value
    m.__defineSetter__ 'm10', (value) -> @[3] = value
    m.__defineSetter__ 'm11', (value) -> @[4] = value
    m.__defineSetter__ 'm12', (value) -> @[5] = value
    m.__defineSetter__ 'm20', (value) -> @[6] = value
    m.__defineSetter__ 'm21', (value) -> @[7] = value
    m.__defineSetter__ 'm22', (value) -> @[8] = value

  set: (m, out) ->
    out[0] = m[0]
    out[1] = m[1]
    out[2] = m[2]
    out[3] = m[3]
    out[4] = m[4]
    out[5] = m[5]
    out[6] = m[6]
    out[7] = m[7]
    out[8] = m[8]
  
    return out

  identity: (out) ->
    out[0] = 1
    out[1] = 0
    out[2] = 0
    out[3] = 0
    out[4] = 1
    out[5] = 0
    out[6] = 0
    out[7] = 0
    out[8] = 1
  
    return out

  toMatrix4: (m, out) ->
    out = Matrix4.create() unless out
    
    out[0] = m[0]
    out[1] = m[1]
    out[2] = m[2]
    out[3] = 0
  
    out[4]  = m[3]
    out[5]  = m[4]
    out[6]  = m[5]
    out[7]  = 0
  
    out[8]  = m[6]
    out[9]  = m[7]
    out[10] = m[8]
    out[11] = 0
  
    out[12] = 0
    out[13] = 0
    out[14] = 0
    out[15] = 1
  
    return out
    
if module?.exports? then module.exports = Matrix3 else @Math.Matrix3 = Matrix3