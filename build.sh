#!/bin/bash
set -e
set +x

trap "cd $(pwd -P)" EXIT
cd "$(dirname "$0")"

if [[ $(uname) == "Darwin" ]]; then
  # Make sure pkg-config picks up dependencies from HomeBrew
  export PKG_CONFIG_PATH='/opt/homebrew/Cellar/sqlite/3.44.0/lib/pkgconfig/'
fi

rm -rf ./build
rm -rf ./out

cmake -DCMAKE_BUILD_TYPE=Release -B build .
cmake --build build -j8
mkdir ./out

if [[ $(uname) == "Darwin" ]]; then
  cp ./build/web_vfs.dylib ./out/web_vfs.dylib
else
  cp ./build/web_vfs.so ./out/web_vfs.so
fi

rm -rf ./build
