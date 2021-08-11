#!/bin/bash

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./dist


cd build_unix
../dist/configure \
  --prefix=$PREFIX \
  --host=${HOST} \
  --enable-shared \
  --disable-static \
  --enable-cxx \
  --enable-stl

make -j$CPU_COUNT
make check -j$CPU_COUNT
make install -j$CPU_COUNT

cd $PREFIX
find . -type f -name "*.la" -exec rm -rf '{}' \; -print
