#!/bin/bash

# writer.sh
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <full path to file> <string to write>"
    exit 1
fi

writefile=$1
writestr=$2
dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $dirpath"
        exit 1
    fi
fi

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile"
    exit 1
fi
