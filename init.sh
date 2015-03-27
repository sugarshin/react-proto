#!/usr/bin/sh

npm i -D browserify coffee-reactify live-server uglify-js watchify
npm i -S react
mkdir -p public/js && echo '<!doctype html>' > public/index.html
rm -rf init.sh
