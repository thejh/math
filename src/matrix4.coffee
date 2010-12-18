# ARRAY_TYPE = if Float32Array? then Float32Array else Array

Matrix4 =
  create: (args) ->
    m = new Array args or 16
    
    m.__defineGetter__ 'm00', -> @[0]
    m.__defineGetter__ 'm01', -> @[1]
    m.__defineGetter__ 'm02', -> @[2]
    m.__defineGetter__ 'm03', -> @[3]
    m.__defineGetter__ 'm10', -> @[4]
    m.__defineGetter__ 'm11', -> @[5]
    m.__defineGetter__ 'm12', -> @[6]
    m.__defineGetter__ 'm13', -> @[7]
    m.__defineGetter__ 'm20', -> @[8]
    m.__defineGetter__ 'm21', -> @[9]
    m.__defineGetter__ 'm22', -> @[10]
    m.__defineGetter__ 'm23', -> @[11]
    m.__defineGetter__ 'm30', -> @[12]
    m.__defineGetter__ 'm31', -> @[13]
    m.__defineGetter__ 'm32', -> @[14]
    m.__defineGetter__ 'm33', -> @[15]
    
    m.__defineSetter__ 'm00', (value) -> @[0]  = value
    m.__defineSetter__ 'm01', (value) -> @[1]  = value
    m.__defineSetter__ 'm02', (value) -> @[2]  = value
    m.__defineSetter__ 'm03', (value) -> @[3]  = value
    m.__defineSetter__ 'm10', (value) -> @[4]  = value
    m.__defineSetter__ 'm11', (value) -> @[5]  = value
    m.__defineSetter__ 'm12', (value) -> @[6]  = value
    m.__defineSetter__ 'm13', (value) -> @[7]  = value
    m.__defineSetter__ 'm20', (value) -> @[8]  = value
    m.__defineSetter__ 'm21', (value) -> @[9]  = value
    m.__defineSetter__ 'm22', (value) -> @[10] = value
    m.__defineSetter__ 'm23', (value) -> @[11] = value
    m.__defineSetter__ 'm30', (value) -> @[12] = value
    m.__defineSetter__ 'm31', (value) -> @[13] = value
    m.__defineSetter__ 'm32', (value) -> @[14] = value
    m.__defineSetter__ 'm33', (value) -> @[15] = value
    
    return m

  set: (m, out) ->
    out[0]  = m[0]
    out[1]  = m[1]
    out[2]  = m[2]
    out[3]  = m[3]
    out[4]  = m[4]
    out[5]  = m[5]
    out[6]  = m[6]
    out[7]  = m[7]
    out[8]  = m[8]
    out[9]  = m[9]
    out[10] = m[10]
    out[11] = m[11]
    out[12] = m[12]
    out[13] = m[13]
    out[14] = m[14]
    out[15] = m[15]

    return out

  identity: (out) ->
    out[0]  = 1
    out[1]  = 0
    out[2]  = 0
    out[3]  = 0
    out[4]  = 0
    out[5]  = 1
    out[6]  = 0
    out[7]  = 0
    out[8]  = 0
    out[9]  = 0
    out[10] = 1
    out[11] = 0
    out[12] = 0
    out[13] = 0
    out[14] = 0
    out[15] = 1

    return out

  transpose: (m, out) ->
    if not out or m is out
      m01 = m[1]
      m02 = m[2]
      m03 = m[3]
      m12 = m[6]
      m13 = m[7]
      m23 = m[11]

      m[1]  = m[4]
      m[2]  = m[8]
      m[3]  = m[12]
      m[4]  = m01
      m[6]  = m[9]
      m[7]  = m[13]
      m[8]  = m02
      m[9]  = m12
      m[11] = m[14]
      m[12] = m03
      m[13] = m13
      m[14] = m23

      return m

    out[0]  = m[0]
    out[1]  = m[4]
    out[2]  = m[8]
    out[3]  = m[12]
    out[4]  = m[1]
    out[5]  = m[5]
    out[6]  = m[9]
    out[7]  = m[13]
    out[8]  = m[2]
    out[9]  = m[6]
    out[10] = m[10]
    out[11] = m[14]
    out[12] = m[3]
    out[13] = m[7]
    out[14] = m[11]
    out[15] = m[15]

    return out

  determinant: (m)->
    a00 = m[0]
    a01 = m[1]
    a02 = m[2]
    a03 = m[3]
    a10 = m[4]
    a11 = m[5]
    a12 = m[6]
    a13 = m[7]
    a20 = m[8]
    a21 = m[9]
    a22 = m[10]
    a23 = m[11]
    a30 = m[12]
    a31 = m[13]
    a32 = m[14]
    a33 = m[15]
    
    return	a30*a21*a12*a03 - a20*a31*a12*a03 - a30*a11*a22*a03 + a10*a31*a22*a03 + a20*a11*a32*a03 - a10*a21*a32*a03 - a30*a21*a02*a13 + a20*a31*a02*a13 + a30*a01*a22*a13 - a00*a31*a22*a13 - a20*a01*a32*a13 + a00*a21*a32*a13 + a30*a11*a02*a23 - a10*a31*a02*a23 - a30*a01*a12*a23 + a00*a31*a12*a23 + a10*a01*a32*a23 - a00*a11*a32*a23 - a20*a11*a02*a33 + a10*a21*a02*a33 + a20*a01*a12*a33 - a00*a21*a12*a33 - a10*a01*a22*a33 + a00*a11*a22*a33

  inverse: (m, out) ->
    out = mat unless out

    a00 = mat[0]
    a01 = mat[1]
    a02 = mat[2]
    a03 = mat[3]
    a10 = mat[4]
    a11 = mat[5]
    a12 = mat[6]
    a13 = mat[7]
    a20 = mat[8]
    a21 = mat[9]
    a22 = mat[10]
    a23 = mat[11]
    a30 = mat[12]
    a31 = mat[13]
    a32 = mat[14]
    a33 = mat[15]

    b00 = a00 * a11 - a01 * a10
    b01 = a00 * a12 - a02 * a10
    b02 = a00 * a13 - a03 * a10
    b03 = a01 * a12 - a02 * a11
    b04 = a01 * a13 - a03 * a11
    b05 = a02 * a13 - a03 * a12
    b06 = a20 * a31 - a21 * a30
    b07 = a20 * a32 - a22 * a30
    b08 = a20 * a33 - a23 * a30
    b09 = a21 * a32 - a22 * a31
    b10 = a21 * a33 - a23 * a31
    b11 = a22 * a33 - a23 * a32

    inverse_determinant = 1 / (b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06)

    out[0]  = ( a11 * b11 - a12 * b10 + a13 * b09) * inverse_determinant
    out[1]  = (-a01 * b11 + a02 * b10 - a03 * b09) * inverse_determinant
    out[2]  = ( a31 * b05 - a32 * b04 + a33 * b03) * inverse_determinant
    out[3]  = (-a21 * b05 + a22 * b04 - a23 * b03) * inverse_determinant
    out[4]  = (-a10 * b11 + a12 * b08 - a13 * b07) * inverse_determinant
    out[5]  = ( a00 * b11 - a02 * b08 + a03 * b07) * inverse_determinant
    out[6]  = (-a30 * b05 + a32 * b02 - a33 * b01) * inverse_determinant
    out[7]  = ( a20 * b05 - a22 * b02 + a23 * b01) * inverse_determinant
    out[8]  = ( a10 * b10 - a11 * b08 + a13 * b06) * inverse_determinant
    out[9]  = (-a00 * b10 + a01 * b08 - a03 * b06) * inverse_determinant
    out[10] = ( a30 * b04 - a31 * b02 + a33 * b00) * inverse_determinant
    out[11] = (-a20 * b04 + a21 * b02 - a23 * b00) * inverse_determinant
    out[12] = (-a10 * b09 + a11 * b07 - a12 * b06) * inverse_determinant
    out[13] = ( a00 * b09 - a01 * b07 + a02 * b06) * inverse_determinant
    out[14] = (-a30 * b03 + a31 * b01 - a32 * b00) * inverse_determinant
    out[15] = ( a20 * b03 - a21 * b01 + a22 * b00) * inverse_determinant

    return out

  toRotationMat: (m, out)->
    out = Matrix4.create() unless out

    out[0]  = m[0]
    out[1]  = m[1]
    out[2]  = m[2]
    out[3]  = m[3]
    out[4]  = m[4]
    out[5]  = m[5]
    out[6]  = m[6]
    out[7]  = m[7]
    out[8]  = m[8]
    out[9]  = m[9]
    out[10] = m[10]
    out[11] = m[11]
    out[12] = 0
    out[13] = 0
    out[14] = 0
    out[15] = 1

    return out

  toMatrix3: (m, out) ->
    out = Matrix3.create() unless out

    out[0] = m[0]
    out[1] = m[1]
    out[2] = m[2]
    out[3] = m[4]
    out[4] = m[5]
    out[5] = m[6]
    out[6] = m[8]
    out[7] = m[9]
    out[8] = m[10]
    
    return out

  toInverseMatrix3: (m, out) ->
    a00 = m[0]
    a01 = m[1]
    a02 = m[2]
    a10 = m[4]
    a11 = m[5]
    a12 = m[6]
    a20 = m[8]
    a21 = m[9]
    a22 = m[10]

    b01 =  a22 * a11 - a12 * a21
    b11 = -a22 * a10 + a12 * a20
    b21 =  a21 * a10 - a11 * a20

    determinant = a00 * b01 + a01 * b11 + a02 * b21
    unless determinant then return
    inverse_determinant = 1 / determinant

    out = Matrix3.create() unless out

    out[0] = b01 * inverse_determinant
    out[1] = (-a22 * a01 + a02 * a21) * inverse_determinant
    out[2] = ( a12 * a01 - a02 * a11) * inverse_determinant
    out[3] = b11                      * inverse_determinant
    out[4] = ( a22 * a00 - a02 * a20) * inverse_determinant
    out[5] = (-a12 * a00 + a02 * a10) * inverse_determinant
    out[6] = b21                      * inverse_determinant
    out[7] = (-a21 * a00 + a01 * a20) * inverse_determinant
    out[8] = ( a11 * a00 - a01 * a10) * inverse_determinant

    return out

  multiply: (a, b, out)->
    out = a unless out

    a00 = a[0]
    a01 = a[1]
    a02 = a[2]
    a03 = a[3]
    a10 = a[4]
    a11 = a[5]
    a12 = a[6]
    a13 = a[7]
    a20 = a[8]
    a21 = a[9]
    a22 = a[10]
    a23 = a[11]
    a30 = a[12]
    a31 = a[13]
    a32 = a[14]
    a33 = a[15]

    b00 = b[0]
    b01 = b[1]
    b02 = b[2]
    b03 = b[3]
    b10 = b[4]
    b11 = b[5]
    b12 = b[6]
    b13 = b[7]
    b20 = b[8]
    b21 = b[9]
    b22 = b[10]
    b23 = b[11]
    b30 = b[12]
    b31 = b[13]
    b32 = b[14]
    b33 = b[15]

    out[0]  = b00 * a00 + b01 * a10 + b02 * a20 + b03 * a30
    out[1]  = b00 * a01 + b01 * a11 + b02 * a21 + b03 * a31
    out[2]  = b00 * a02 + b01 * a12 + b02 * a22 + b03 * a32
    out[3]  = b00 * a03 + b01 * a13 + b02 * a23 + b03 * a33
    out[4]  = b10 * a00 + b11 * a10 + b12 * a20 + b13 * a30
    out[5]  = b10 * a01 + b11 * a11 + b12 * a21 + b13 * a31
    out[6]  = b10 * a02 + b11 * a12 + b12 * a22 + b13 * a32
    out[7]  = b10 * a03 + b11 * a13 + b12 * a23 + b13 * a33
    out[8]  = b20 * a00 + b21 * a10 + b22 * a20 + b23 * a30
    out[9]  = b20 * a01 + b21 * a11 + b22 * a21 + b23 * a31
    out[10] = b20 * a02 + b21 * a12 + b22 * a22 + b23 * a32
    out[11] = b20 * a03 + b21 * a13 + b22 * a23 + b23 * a33
    out[12] = b30 * a00 + b31 * a10 + b32 * a20 + b33 * a30
    out[13] = b30 * a01 + b31 * a11 + b32 * a21 + b33 * a31
    out[14] = b30 * a02 + b31 * a12 + b32 * a22 + b33 * a32
    out[15] = b30 * a03 + b31 * a13 + b32 * a23 + b33 * a33

    return out

  multiplyVector3: (m, v, out) ->
    out = v unless out

    x = v[0]
    y = v[1]
    z = v[2]

    out[0] = m[0] * x + m[4] * y + m[8]  * z + m[12]
    out[1] = m[1] * x + m[5] * y + m[9]  * z + m[13]
    out[2] = m[2] * x + m[6] * y + m[10] * z + m[14]

    return out

  multiplyVector4: (m, v, out) ->
    out = v unless out

    x = vec[0]
    y = vec[1]
    z = vec[2]
    w = vec[3]

    out[0] = m[0] * x + m[4] * y + m[8]  * z + m[12] * w
    out[1] = m[1] * x + m[5] * y + m[9]  * z + m[13] * w
    out[2] = m[2] * x + m[6] * y + m[10] * z + m[14] * w
    out[4] = m[4] * x + m[7] * y + m[11] * z + m[15] * w

    return out

  translate: (m, v, out) ->
    x = v[0]
    y = v[1]
    z = v[2]

    if not out or m is out
      m[12] = m[0] * x + m[4] * y + m[8]  * z + m[12]
      m[13] = m[1] * x + m[5] * y + m[9]  * z + m[13]
      m[14] = m[2] * x + m[6] * y + m[10] * z + m[14]
      m[15] = m[3] * x + m[7] * y + m[11] * z + m[15]

      return m

    a00 = m[0]
    a01 = m[1]
    a02 = m[2]
    a03 = m[3]
    a10 = m[4]
    a11 = m[5]
    a12 = m[6]
    a13 = m[7]
    a20 = m[8]
    a21 = m[9]
    a22 = m[10]
    a23 = m[11]
    
    out[0]  = m00
    out[1]  = m01
    out[2]  = m02
    out[3]  = m03
    out[4]  = m10
    out[5]  = m11
    out[6]  = m12
    out[7]  = m13
    out[8]  = m20
    out[9]  = m21
    out[10] = m22
    out[11] = m23
    out[12] = m00 * x + m10 * y + m20 * z + m[12]
    out[13] = m01 * x + m11 * y + m21 * z + m[13]
    out[14] = m02 * x + m12 * y + m22 * z + m[14]
    out[15] = m03 * x + m13 * y + m23 * z + m[15]

    return out

  scale: (m, v, out) ->
    x = v[0]
    y = v[1]
    z = v[2]

    if not out or m is out
      m[0]  = x
      m[1]  = x
      m[2]  = x
      m[3]  = x

      m[4]  = y
      m[5]  = y
      m[6]  = y
      m[7]  = y

      m[8]  = z
      m[9]  = z
      m[10] = z
      m[11] = z

      return m

    out[0]  = m[0]  * x
    out[1]  = m[1]  * x
    out[2]  = m[2]  * x
    out[3]  = m[3]  * x

    out[4]  = m[4]  * y
    out[5]  = m[5]  * y
    out[6]  = m[6]  * y
    out[7]  = m[7]  * y

    out[8]  = m[8]  * z
    out[9]  = m[9]  * z
    out[10] = m[10] * z
    out[11] = m[11] * z

    out[12] = m[12]
    out[13] = m[13]
    out[14] = m[14]
    out[15] = m[15]

    return dest

  rotate: (m, angle, axis, out) ->
    x = axis[0]
    y = axis[1]
    z = axis[2]

    magnitude = Math.sqrt x * x + y * y + z * z
    unless magnitude then return
    if magnitude isnt 1
      magnitude = 1 / magnitude
      x *= magnitude
      y *= magnitude
      z *= magnitude

    s = Math.sin angle
    c = Math.cos angle
    t = 1 - c

    a00 = m[0]
    a01 = m[1]
    a02 = m[2]
    a03 = m[3]
    a10 = m[4]
    a11 = m[5]
    a12 = m[6]
    a13 = m[7]
    a20 = m[8]
    a21 = m[9]
    a22 = m[10]
    a23 = m[11]

    b00 = x * x * t + c
    b01 = y * x * t + z * s
    b02 = z * x * t - y * s
    b10 = x * y * t - z * s
    b11 = y * y * t + c
    b12 = z * y * t + x * s
    b20 = x * z * t + y * s
    b21 = y * z * t - x * s
    b22 = z * z * t + c
    
    unless out then out = m
    else if m isnt out
      out[12] = m[12]
      out[13] = m[13]
      out[14] = m[14]
      out[15] = m[15]

    out[0] = a00 * b00 + a10 * b01 + a20 * b02
    out[1] = a01 * b00 + a11 * b01 + a21 * b02
    out[2] = a02 * b00 + a12 * b01 + a22 * b02
    out[3] = a03 * b00 + a13 * b01 + a23 * b02
    
    out[4] = a00 * b10 + a10 * b11 + a20 * b12
    out[5] = a01 * b10 + a11 * b11 + a21 * b12
    out[6] = a02 * b10 + a12 * b11 + a22 * b12
    out[7] = a03 * b10 + a13 * b11 + a23 * b12
    
    out[8] = a00 * b20 + a10 * b21 + a20 * b22
    out[9] = a01 * b20 + a11 * b21 + a21 * b22
    out[10] = a02 * b20 + a12 * b21 + a22 * b22
    out[11] = a03 * b20 + a13 * b21 + a23 * b22

    return out

  rotateX: (m, angle, out) ->
    s = Math.sin angle
    c = Math.cos angle

    m10 = m[4]
    m11 = m[5]
    m12 = m[6]
    m13 = m[7]

    m20 = m[8]
    m21 = m[9]
    m22 = m[10]
    m23 = m[11]

    if not out
      out = m
    else if m isnt out
      out[0] = m[0]
      out[1] = m[1]
      out[2] = m[2]
      out[3] = m[3]

      out[12] = m[12]
      out[13] = m[13]
      out[14] = m[14]
      out[15] = m[15]

    out[4]  = m10 *  c + m20 * s
    out[5]  = m11 *  c + m21 * s
    out[6]  = m12 *  c + m22 * s
    out[7]  = m13 *  c + m23 * s

    out[8]  = m10 * -s + m20 * c
    out[9]  = m11 * -s + m21 * c
    out[10] = m12 * -s + m22 * c
    out[11] = m13 * -s + m23 * c

    return out

  rotateY: (m, angle, out) ->
    s = Math.sin angle
    c = Math.cos angle

    m00 = m[0]
    m01 = m[1]
    m02 = m[2]
    m03 = m[3]

    m20 = m[8]
    m21 = m[9]
    m22 = m[10]
    m23 = m[11]

    unless out then out = m
    else if m isnt out
      out[4] = m[4]
      out[5] = m[5]
      out[6] = m[6]
      out[7] = m[7]

      out[12] = m[12]
      out[13] = m[13]
      out[14] = m[14]
      out[15] = m[15]

    out[0]  = m00 * c + m20 * -s
    out[1]  = m01 * c + m21 * -s
    out[2]  = m02 * c + m22 * -s
    out[3]  = m03 * c + m23 * -s

    out[8]  = m00 * s + m20 *  c
    out[9]  = m01 * s + m21 *  c
    out[10] = m02 * s + m22 *  c
    out[11] = m03 * s + m23 *  c

    return out

  rotateZ: (m, angle, out) ->
    s = Math.sin angle
    c = Math.cos angle

    m00 = m[0]
    m01 = m[1]
    m02 = m[2]
    m03 = m[3]

    m10 = m[4]
    m11 = m[5]
    m12 = m[6]
    m13 = m[7]

    unless out then out = m
    else if m isnt out
      out[8]  = m[8]
      out[9]  = m[9]
      out[10] = m[10]
      out[11] = m[11]

      out[12] = m[12]
      out[13] = m[13]
      out[14] = m[14]
      out[15] = m[15]

    out[0] = m00 *  c + m10 * s
    out[1] = m01 *  c + m11 * s
    out[2] = m02 *  c + m12 * s
    out[3] = m03 *  c + m13 * s

    out[4] = m00 * -s + m10 * c
    out[5] = m01 * -s + m11 * c
    out[6] = m02 * -s + m12 * c
    out[7] = m03 * -s + m13 * c

    return out

  frustum: (left, right, bottom, top, near, far, out) ->
    out = Matrix4.create() unless out

    rl = right - left
    tb = top   - bottom
    fn = far   - near

    out[0]  =  (near * 2) / rl
    out[1]  =  0
    out[2]  =  0
    out[3]  =  0
    out[4]  =  0
    out[5]  =  (near * 2) / tb
    out[6]  =  0
    out[7]  =  0
    out[8]  =  (right + left) / rl
    out[9]  =  (top + bottom) / tb
    out[10] = -(far + near) / fn
    out[11] = -1
    out[12] =  0
    out[13] =  0
    out[14] = -(far * near * 2) / fn
    out[15] =  0

    return out

  perspective: (fov, aspect, near, far, out) ->
    top = near * Math.tan(fov * Math.PI / 360)
    right = top * aspect

    return Matrix4.frustum -right, right, -top, top, near, far, out

  ortho: (left, right, bottom, top, near, far, out) ->
    out = Matrix4.create() unless out

    rl = right - left
    tb = top   - bottom
    fn = far   - near

    out[0]  = 2 / rl
    out[1]  = 0
    out[2]  = 0
    out[3]  = 0
    out[4]  = 0
    out[5]  = 2 / tb
    out[6]  = 0
    out[7]  = 0
    out[8]  = 0
    out[9]  = 0
    out[10] = -2 / fn
    out[11] = 0
    out[12] = -(left + right)  / rl
    out[13] = -(top  + bottom) / tb
    out[14] = -(far  + near)   / fn
    out[15] = 1

    return dest

  lookAt: (eye, center, up, out) ->
    out = Matrix4.create() unless out

    eye_x = eye[0]
    eye_y = eye[1]
    eye_z = eye[2]

    up_x = up[0]
    up_y = up[1]
    up_z = up[2]

    center_x = center[0]
    center_y = center[1]
    center_z = center[2]

    if eye_x is center_x and eye_y is center_y and eye_z is center_z
      return Matrix4.identity out

    z0 = eye_x - center[0]
    z1 = eye_y - center[1]
    z2 = eye_z - center[2]

    magnitude = 1 / Math.sqrt(z0 * z0 + z1 * z1 + z2 * z2)

    z0 *= magnitude
    z1 *= magnitude
    z2 *= magnitude

    x0 = up_y * z2 - up_z * z1
    x1 = up_z * z0 - up_x * z2
    x2 = up_x * z1 - up_y * z0

    magnitude = Math.sqrt x0 * x0 + x1 * x1 + x2 * x2

    unless magnitude
      x0 = 0
      x1 = 0
      x2 = 0
    else
      magnitude = 1 / magnitude
      x0 *= magnitude
      x1 *= magnitude
      x2 *= magnitude

    y0 = z1 * x2 - z2 * x1
    y1 = z2 * x0 - z0 * x2
    y2 = z0 * x1 - z1 * x0

    magnitude = Math.sqrt y0 * y0 + y1 * y1 + y2 * y2

    if !magnitude
      y0 = 0
      y1 = 0
      y2 = 0
    else
      magnitude = 1 / magnitude
      y0 *= magnitude
      y1 *= magnitude
      y2 *= magnitude

    out[0]  = x0
    out[1]  = y0
    out[2]  = z0
    out[3]  = 0
    out[4]  = x1
    out[5]  = y1
    out[6]  = z1
    out[7]  = 0
    out[8]  = x2
    out[9]  = y2
    out[10] = z2
    out[11] = 0
    out[12] = -(x0 * eye_x + x1 * eye_y + x2 * eye_z)
    out[13] = -(y0 * eye_x + y1 * eye_y + y2 * eye_z)
    out[14] = -(z0 * eye_x + z1 * eye_y + z2 * eye_z)
    out[15] = 1

    return out

if module?.exports? then module.exports = Matrix4 else @Math.Matrix4 = Matrix4