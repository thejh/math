components = ['Matrix3', 'Matrix4', 'Quaternion', 'Vector2', 'Vector3']

ARRAY_TYPE = if Float32Array? then Float32Array else Array

Math =
  ARRAY_TYPE: ARRAY_TYPE
  extend: (root) ->
    for component in components
      root[component] = Math[component]
      root.ARRAY_TYPE = ARRAY_TYPE

for component in components
  path = "./#{component.toLowerCase()}"
  Math[component] = require path

if module?.exports? then module.exports = Math else Math.extend @Math