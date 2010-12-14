{exec, spawn} = require 'child_process'
fs = require 'fs'
{print, puts, debug} = require 'sys'

log = console.log

CoffeeScript = require 'coffee-script'

colors =
  reset: "\x1B[0m"

  grey:    "\x1B[0;30m"
  red:     "\x1B[0;31m"
  green:   "\x1B[0;32m"
  yellow:  "\x1B[0;33m"
  blue:    "\x1B[0;34m"
  magenta: "\x1B[0;35m"
  cyan:    "\x1B[0;36m"
  white:   "\x1B[0;37m"

  bold:
    grey:    "\x1B[1;30m"
    red:     "\x1B[1;31m"
    green:   "\x1B[1;32m"
    yellow:  "\x1B[1;33m"
    blue:    "\x1B[1;34m"
    magenta: "\x1B[1;35m"
    cyan:    "\x1B[1;36m"
    white:   "\x1B[1;37m"

color = (color, data) ->
    return color + data + colors.reset

task 'init', 'init', ->
  invoke 'build'

task 'test', 'test', ->
  # invoke 'build' # invoke has no callbacks?
  exec 'cake build', (error, stdout, stderr) ->
    print stdout
      
    vows = spawn 'vows', ['--verbose', '--spec', 'test/matrix4.coffee']
    vows.stdout.on 'data', (data) ->
      # log color(colors.green, "#{data}")
      print "#{data}"

    vows.stderr.on 'data', (data) ->
      log color(colors.red, "#{data}")

    vows.on 'exit', (code) ->
      log color(colors.yellow, "child process exited with code: #{code}")

# option '-p', '--port [PORT]', 'port to listen on'
# task 'server', 'server', (options) ->
#   options.port = options.port or '1337'
#   zappa = spawn 'zappa', ['--port', options.port, '--watch', 'app.coffee']
#   zappa.stdout.on 'data', (data) ->
#     log color(colors.green, "#{data}")
# 
#   zappa.stderr.on 'data', (data) ->
#     log color(colors.red, "#{data}")
# 
#   zappa.on 'exit', (code) ->
#     log color(colors.yellow, "child process exited with code: #{code}")

task 'build', 'build', ->
  log color(colors.yellow, '# building math')

  exec 'mkdir -p lib', ->
    exec 'coffee --bare -o lib -c src/*.coffee', (error, stdout, stderr) ->
      if error then puts error
      else
        log color(colors.green, "#{stdout}")
        log color(colors.red, "#{stderr}")
        
        log color(colors.green, '# built math')

task 'release', 'release', ->
  fs.readFile 'package.coffee', (error, data) ->
    throw error if error

    coffee = data.toString()
    js = CoffeeScript.compile coffee, bare: true
    re = /\(([\s\S]*)\);/m
    matches = re.exec js
    json = matches[1]

    fs.writeFile 'package.json', json, ->
      log json
      
task 'describe', 'describe', ->
  math = require './lib/math'
  math.extend Math

  for key, value of Math
    log "Math.#{key} = #{value}"