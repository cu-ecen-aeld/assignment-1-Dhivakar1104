#!/bin/bash

# writer.sh
# Usage: writer.sh <writefile> <writestr>

# Check if both arguments are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <full path to file> <string to write>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the file path
dirpath=$(dirname "$writefile")

# Create directory if it doesn't exist
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath"
        exit 1
    fi
fi

# Write the string to the file, overwrite if it exists
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile"
    exit 1
fi
