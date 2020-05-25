#!/bin/bash

if ! [ -x "$(command -v emcc)" ]; then
  echo 'emcc is not installed, please follow the installation instructions here:' >&2
  echo 'https://emscripten.org/docs/getting_started/downloads.html' >&2
  exit 1
fi

file_to_compile="hello.c"
if [[ ! -f "$file_to_compile" ]]; then
  echo 'Please pass a filename as an argument, example:'
  echo "$ $0 file_to_compile.c"
  exit 1
fi
if [[ ! -d 'tmp' ]]; then
  mkdir 'tmp'
fi

emcc "$file_to_compile" -o "tmp/index.html"

echo "Running the compiled page, open it on:"
echo "http://localhost:8080/index.html"
echo ""
echo ""
emrun --no_browser --port 8080 tmp/
