Quaternion =
  create: (args) ->
    q = new Math.ARRAY_TYPE args
    
    q.__defineGetter__ 'x', -> @[0]
    q.__defineGetter__ 'y', -> @[1]
    q.__defineGetter__ 'z', -> @[2]
    q.__defineGetter__ 'w', -> @[3]
    
    q.__defineSetter__ 'x', (value) -> @[0] = value
    q.__defineSetter__ 'y', (value) -> @[1] = value
    q.__defineSetter__ 'z', (value) -> @[2] = value
    q.__defineSetter__ 'w', (value) -> @[3] = value
    
    return q

  set: (q, out) ->
    out[0] = q[0]
    out[1] = q[1]
    out[2] = q[2]
    out[3] = q[3]

    return out

  calculateW: (q, out) ->
    x = q[0]
    y = q[1]
    z = q[2]

    if !out or q is out
      q[3] = -Math.sqrt(Math.abs(1.0 - x*x - y*y - z*z))
      
      return q

    out[0] = x
    out[1] = y
    out[2] = z
    out[3] = -Math.sqrt(Math.abs(1.0 - x*x - y*y - z*z))

    return out

  inverse: (q, out) ->
    if !out or q is out
      q[0] *= 1
      q[1] *= 1
      q[2] *= 1
      
      return q

    out[0] = -q[0]
    out[1] = -q[1]
    out[2] = -q[2]
    out[3] =  q[3]

    return out

  length: (q) ->
    x = q[0]
    y = q[1]
    z = q[2]
    w = q[3]

    return Math.sqrt x * x + y * y + z * z + w * w

  normalize: (q, out) ->
    out = q unless out

    x = q[0]
    y = q[1]
    z = q[2]
    w = q[3]

    magnitude = Math.sqrt x * x + y * y + z * z + w * w

    if magnitude is 0
      out[0] = 0
      out[1] = 0
      out[2] = 0
      out[3] = 0
      
      return out

    magnitude = 1 / magnitude
    out[0] = x * magnitude
    out[1] = y * magnitude
    out[2] = z * magnitude
    out[3] = w * magnitude

    return out

  multiply: (a, b, out) ->
    out = a unless out

    a_x = a[0]
    a_y = a[1]
    a_z = a[2]
    a_w = a[3]

    b_x = b[0]
    b_y = b[1]
    b_z = b[2]
    b_w = b[3]

    out[0] = a_x * b_w + a_w * b_x + a_y * b_z - a_z * b_y
    out[1] = a_y * b_w + a_w * b_y + a_z * b_x - a_x * b_z
    out[2] = a_z * b_w + a_w * b_z + a_x * b_y - a_y * b_x
    out[3] = a_w * b_w - a_x * b_x - a_y * b_y - a_z * b_z

    return out

  multiplyVector3: (q, v, out) ->
    out = v unless out

    x = v[0]
    y = v[1]
    z = v[2]

    qx = q[0]
    qy = q[1]
    qz = q[2]
    qw = q[3]

    ix =  qw * x + qy * z - qz * y
    iy =  qw * y + qz * x - qx * z
    iz =  qw * z + qx * y - qy * x
    iw = -qx * x - qy * y - qz * z

    out[0] = ix * qw + iw * -qx + iy * -qz - iz * -qy
    out[1] = iy * qw + iw * -qy + iz * -qx - ix * -qz
    out[2] = iz * qw + iw * -qz + ix * -qy - iy * -qx

    return out

  toMatrix3: (q, out) ->
    out = Matrix3.create() unless out

    x = q[0]
    y = q[1]
    z = q[2]
    w = q[3]

    x2 = x + x
    y2 = y + y
    z2 = z + z

    xx = x * x2
    xy = x * y2
    xz = x * z2

    yy = y * y2
    yz = y * z2
    zz = z * z2

    wx = w * x2
    wy = w * y2
    wz = w * z2

    out[0] = 1 - (yy + zz)
    out[1] = xy - wz
    out[2] = xz + wy

    out[3] = xy + wz
    out[4] = 1 - (xx + zz)
    out[5] = yz - wx

    out[6] = xz - wy
    out[7] = yz + wx
    out[8] = 1 - (xx + yy)

    return out

  toMatrix4: (q, out) ->
    out = Matrix3.create() unless out

    x = q[0]
    y = q[1]
    z = q[2]
    w = q[3]

    x2 = x + x
    y2 = y + y
    z2 = z + z

    xx = x * x2
    xy = x * y2
    xz = x * z2

    yy = y * y2
    yz = y * z2
    zz = z * z2

    wx = w * x2
    wy = w * y2
    wz = w * z2

    dest[0] = 1 - (yy + zz)
    dest[1] = xy - wz
    dest[2] = xz + wy
    dest[3] = 0

    dest[4] = xy + wz
    dest[5] = 1 - (xx + zz)
    dest[6] = yz - wx
    dest[7] = 0

    dest[8] = xz - wy
    dest[9] = yz + wx
    dest[10] = 1 - (xx + yy)
    dest[11] = 0

    dest[12] = 0
    dest[13] = 0
    dest[14] = 0
    dest[15] = 1

    return out
    
if module?.exports? then module.exports = Quaternion else @Math.Quaternion = Quaternion