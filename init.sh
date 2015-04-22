#!/usr/bin/sh

npm i -D budo coffee-reactify garnish watchify
npm i -S react
echo "\"use strict\"\n\nReact = require 'react'" > main.cjsx
rm -rf .git init.sh
