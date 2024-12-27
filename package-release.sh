#!/bin/bash

set -e

shopt -s extglob

if [ -z "$1" ]; then
  echo "Usage: package-release.sh destdir"
  exit 1
fi

NVOFAPI_SRC_DIR=`dirname $(readlink -f $0)`
NVOFAPI_BUILD_DIR=$(realpath "$1")"/nvofapi64"

if [ -e "$NVOFAPI_BUILD_DIR" ]; then
  echo "Build directory $NVOFAPI_BUILD_DIR already exists"
  exit 1
fi

# build nvofapi

cd "$NVOFAPI_SRC_DIR"

meson --cross-file "$NVOFAPI_SRC_DIR/build-wine64.txt"  \
      --buildtype release                               \
      --prefix "$NVOFAPI_BUILD_DIR"                     \
      --libdir "x64"                                    \
      --strip                                           \
      "$NVOFAPI_BUILD_DIR/build"

cd "$NVOFAPI_BUILD_DIR/build"
ninja install

rm -R "$NVOFAPI_BUILD_DIR/build"

# cleanup
cd $NVOFAPI_BUILD_DIR
find . -name \*.a -type f -delete
find . -name "*.dll.so" -type f -exec bash -c 'mv "$0" "${0%.so}"' {} \;
echo "Done building!"
