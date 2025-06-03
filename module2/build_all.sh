#!/bin/bash

# Ensure bin directory exists and clear it
mkdir -p bin
rm -f bin/*

echo "Cleared bin directory."

# Loop over all .asm files in asm/
for asm_file in asm/*.asm; do
    # Extract just the filename without path or extension
    filename=$(basename "$asm_file" .asm)
    
    # Build the output path
    bin_file="bin/${filename}.bin"
    
    echo "Building $asm_file -> $bin_file"
    
    # Run the build command
    binasm < "$asm_file" > "$bin_file"
done

echo "All builds complete!"
