{
  name: 'math'
  description: 'Extensions to CommonJS "Math" module'
  
  keywords: ['math']
  
  version: '0.1.0'
  
  author: 'Feisty Studios <math@feistystudios.com> (http://feistystudios.com/)'
  
  licenses: [
    {
      type: 'FEISTY'
      url: 'http://github.com/feisty/license/raw/master/LICENSE'
    }
  ]
  
  contributors: [
    'Nicholas Kinsey <nicholas.kinsey@feistystudios.com>'
    'Nathan Rashleigh <nathan.rashleigh@feistystudios.com>'
  ]
  
  repository:
    type: 'git'
    url: 'http://github.com/feisty/math.git'
    private: 'git@github.com:feisty/math.git'
    web: 'http://github.com/feisty/math'
  
  bugs:
    mail: 'math@feistystudios.com'
    web: 'http://github.com/feisty/math/issues'
    
  directories:
    lib: './lib'
    doc: './doc'
  
  # bin:
  #   math: './bin/math'
    
  main: 'lib/index.js'
  
  scripts:
    test: 'cake test'
    postinstall: 'cake init'
    
  dependencies:
    'coffee-script': '>= 1.0.0'
    'vows': '>= 0.5.2 <0.6.0'
    
  engines:
    node: '>= 0.3.4'
}