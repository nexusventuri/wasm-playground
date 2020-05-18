#!/bin/bash

if ! [ -x "$(command -v emcc)" ]; then
  echo 'emcc is not installed, please follow the installation instructions here:' >&2
  echo 'https://emscripten.org/docs/getting_started/downloads.html' >&2
  exit 1
fi

file_to_compile="$1"
if [[ ! -f "$file_to_compile" ]]; then
  echo 'Please pass a filename as an argument, example:'
  echo "$ $0 file_to_compile.c"
  exit 1
fi

if [[ -f 'tmp' ]]; then
  mkdir tmp
fi

file_with_no_extention="${file_to_compile%.*}"

emcc "$file_to_compile" -o "tmp/$file_with_no_extention.html"

echo "Running the compiled page, open it on:"
echo "http://localhost:8080/$file_with_no_extention.html"
echo ""
echo ""
emrun --no_browser --port 8080 tmp/
