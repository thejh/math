components = ['Matrix3', 'Matrix4', 'Quaternion', 'Vector2', 'Vector3']

Math =
  ARRAY_TYPE: if Float32Array? then Float32Array else Array
  extend: (root) ->
    for component in components
      root[component] = Math[component]

for component in components
  path = "./#{component.toLowerCase()}"
  Math[component] = require path

if module?.exports? then module.exports = Math else Math.extend @Math