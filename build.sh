#!/bin/bash

set -x
mkdir -p build_dir

./configure --enable-debug --enable-cassert --prefix=$(realpath build_dir)

make -j$(nproc)
make install