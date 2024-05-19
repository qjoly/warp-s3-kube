#!/bin/bash

# Create the output directory if it doesn't exist
output_dir="./_out"
mkdir -p "$output_dir"

# Function to generate a random filename
random_filename() {
  local length=10
  tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c $length
}

# Number of files to generate
num_files=10000

# Minimum and maximum sizes
min_size=$((10 * 1024))  # 10KB
max_size=$((10 * 1024 * 1024))  # 10MB

# Calculate the size increment
size_increment=$(( (max_size - min_size) / (num_files - 1) ))

for ((i=0; i<num_files; i++)); do
  filename="$(i).bin"
  filepath="$output_dir/$filename"
  size=$(( min_size + i * size_increment ))
  dd if=/dev/urandom of="$filepath" bs=1 count="$size" iflag=fullblock &> /dev/null
done

echo "Generated $num_files files with sizes from 10KB to 10MB in $output_dir"
