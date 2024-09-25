#!/bin/bash

BIN_DIR=build_dir/bin

cd $BIN_DIR

directory="/data1/siyuan_pgsql/data"

rm -rf $directory
./initdb -d $directory

./postgres --single -D $directory postgres -I