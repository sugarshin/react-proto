#!/usr/bin/sh

npm i -D babelify browser-sync browserify coffee-script del gulp gulp-duration gulp-if gulp-notify gulp-sequence gulp-uglify require-dir vinyl-buffer vinyl-source-stream watchify
npm i -S react
mkdir -p src/{js} public/{js}
touch src/js/main.js public/index.html 
rm -rf .git
