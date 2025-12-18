#!/bin/bash

# finder.sh
# Usage: finder.sh <filesdir> <searchstr>

# Exit with error if parameters are missing
if [ $# -lt 2 ]; then
    echo "Error: Missing parameters."
    echo "Usage: $0 <directory> <search string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the directory exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# Count total number of files (recursively)
num_files=$(find "$filesdir" -type f | wc -l)

# Count total number of lines matching search string
num_matches=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print result
echo "The number of files are $num_files and the number of matching lines are $num_matches"
