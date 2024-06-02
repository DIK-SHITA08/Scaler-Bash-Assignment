#!/bin/bash

# Prompt for directory path
read -p "Enter the directory path: " directory

# Initialize a dictionary to store file counts
declare -A file_counts

# Traverse the directory recursively
for file in $(find "$directory" -type f); do
    # Extract the file extension
    extension="${file##*.}"
    
    # Increment the count for the file type
    ((file_counts[$extension]++))
done

# Print the sorted file types and their counts
echo "File Type    Count"
echo "-------------------------------"
for extension in "${!file_counts[@]}"; do
    echo "$extension\t${file_counts[$extension]}"
done | sort -k1,1 -k2nr
