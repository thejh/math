    MMMMMMMM               MMMMMMMM                          tttt         hhhhhhh             
    M:::::::M             M:::::::M                       ttt:::t         h:::::h             
    M::::::::M           M::::::::M                       t:::::t         h:::::h             
    M:::::::::M         M:::::::::M                       t:::::t         h:::::h             
    M::::::::::M       M::::::::::M  aaaaaaaaaaaaa  ttttttt:::::ttttttt    h::::h hhhhh       
    M:::::::::::M     M:::::::::::M  a::::::::::::a t:::::::::::::::::t    h::::hh:::::hhh    
    M:::::::M::::M   M::::M:::::::M  aaaaaaaaa:::::at:::::::::::::::::t    h::::::::::::::hh  
    M::::::M M::::M M::::M M::::::M           a::::atttttt:::::::tttttt    h:::::::hhh::::::h 
    M::::::M  M::::M::::M  M::::::M    aaaaaaa:::::a      t:::::t          h::::::h   h::::::h
    M::::::M   M:::::::M   M::::::M  aa::::::::::::a      t:::::t          h:::::h     h:::::h
    M::::::M    M:::::M    M::::::M a::::aaaa::::::a      t:::::t          h:::::h     h:::::h
    M::::::M     MMMMM     M::::::Ma::::a    a:::::a      t:::::t    tttttth:::::h     h:::::h
    M::::::M               M::::::Ma::::a    a:::::a      t::::::tttt:::::th:::::h     h:::::h
    M::::::M               M::::::Ma:::::aaaa::::::a      tt::::::::::::::th:::::h     h:::::h
    M::::::M               M::::::M a::::::::::aa:::a       tt:::::::::::tth:::::h     h:::::h
    MMMMMMMM               MMMMMMMM  aaaaaaaaaa  aaaa         ttttttttttt  hhhhhhh     hhhhhhh

Math - high performance 2D/3D extensions for CommonJS's "Math" module

# Features

* [As good as it gets](https://github.com/pyrotechnick/math/wiki/performance)
* Targets CommonJS environments (and the browser)
* Versatile, functional API
* Primitives (Arrays) over Objects
* Written in CoffeeScript (with compiled/optimised/minified JavaScript distributions)
* Build system and client-side loader

## Mathematical Primitives

* vectors (2D, 3D)
* matrices (3D, 4D)
* quaternions
* more coming soon

## Geometrical Primitives
* TODO

## Other mathematical facilities
* TODO

# Installation
    npm install math
    
# Usage
    require('math').extend(Math)

### Bundling Math for browsers
To use Math on the client (in the browser), simply pack it with requisition...

    cake pack
    
before copy or link `lib/library.js` into your project and including it on the client.

For example, if we symlink the entire Math project into ~/facebook_killer/public/vendor/feisty/math ...

    <script src="/vendor/feisty/math/lib/library.js" type="text/javascript" />

Now we're able to require Math on the client

    require('./math').extend(Math)

# "Golden Rules"

* DO constantly strive to increase performance
* DO make breaking changes to increase performance or increase user-friendliness
* DO extend the native Math module (with an optional safe-mode)
* DO maintain full interoperability with WebGL (use Typed Arrays when available)
* DO cover _everything_ that matters with one or more tests

* DO NOT accept decreases in performance

# It's a bug if...
  * tests fail in any targeted environment.
  * performance is decreased.
  
# Credit where credit is due
  * [glMatrix](http://code.google.com/p/glmatrix/) by Tojiro

# Contributors
  * Nicholas Kinsey <nicholas.kinsey@feistystudios.com>
  * Nathan Rashleigh <nathan.rashleigh@feistystudios.com>