gulp = require 'gulp'
browserSync = require 'browser-sync'
sequence = require 'gulp-sequence'
requireDir = require 'require-dir'
C = require('./package.json').projectConf

requireDir './tasks'

reload = browserSync.reload

gulp.task 'serve', ->
  browserSync
    notify: false
    startPath: '/'
    server:
      baseDir: './'
      index: "#{C.PUBLIC}/"
      routes:
        '/': "#{C.PUBLIC}/"

gulp.task 'default', ['watch-js', 'serve'], ->
gulp.task 'build', sequence 'clean', 'build-js'
