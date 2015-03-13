gulp = require 'gulp'
gIf = require 'gulp-if'
duration = require 'gulp-duration'
notify = require 'gulp-notify'
uglify = require 'gulp-uglify'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
watchify = require 'watchify'

C = require('../package.json').projectConf


config =
  bundle: 'bundle.js'
  src: "./#{C.SRC}/js/main.js"
  dest: "#{C.PUBLIC}/js"
  browserify:
    # debug: true
    transform: ['babelify']

errorHandler = (args...) ->
  notify
    .onError
      title: 'Task Error'
      message: '<%= error %>'
    .apply @, args
  @emit 'end'

###
 * @param {Bool} minify
 * @param {Bool} watch
 * @return {Object} gulp stream
###
compile = (minify, watch) ->
  if watch
    option = config.browserify
    option.cache = {}
    option.packageCache = {}
    option.fullPaths = true
    bundler = watchify browserify config.src, option
  else
    bundler = browserify config.src, config.browserify

  bundle = ->
    bundler
      .bundle()
      .on 'error', errorHandler
      .pipe source config.bundle
      .pipe duration "compiled => #{config.bundle}"
      .pipe buffer()
      .pipe gIf minify, uglify()
      .pipe gulp.dest config.dest

  bundler.on 'update', bundle

  return bundle()

gulp.task 'js', -> compile false

gulp.task 'build-js', -> compile true

gulp.task 'watch-js', -> compile false, true
