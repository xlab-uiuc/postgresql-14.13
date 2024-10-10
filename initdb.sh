#!/bin/bash

BIN_DIR=build_dir/bin

cd $BIN_DIR

directory="/data1/siyuan_pgsql/data"

rm -rf $directory
./initdb -d $directory

./postgres --single -D $directory postgres -I


cd $directory

# Input file (replace with your actual file)
input_file="postgresql.conf"

# Backup the original file before making changes
cp "$input_file" "$input_file.bak"

# Comment out the line starting with 'shared_buffers ='
sed -i '/^shared_buffers =/s/^/# /' "$input_file"

# shared_buffers_size="64GB"
# Add the new 'shared_buffers = 64GB' line after the commented line
sed -i '/^# shared_buffers =/a shared_buffers = 64GB' "$input_file"

echo "Updated shared_buffers to 64GB in $input_file"
