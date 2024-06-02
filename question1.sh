#!/bin/bash

# Check if a log file path is provided as a command line argument
if [ -z "$1" ]; then
  echo "Error: Log file path not provided."
  exit 1
fi

# Check if the log file exists and is readable
if [ ! -r "$1" ]; then
  echo "Error: Log file '$1' does not exist or is not readable."
  exit 1
fi

# Count the total number of requests
total_requests=$(wc -l < "$1")

# Count successful requests (HTTP status codes 200-299)
successful_requests=$(grep -E -c '"\s[2-9][0-9][0-9]\s' "$1")

# Calculate the percentage of successful requests
successful_percentage=$((successful_requests * 100 / total_requests))

# Find the most active user (IP address with the most requests)
most_active_user=$(awk '{print $1}' "$1" | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

# Output the results
echo "Total Requests: $total_requests"
echo "Successful Requests: $successful_requests (${successful_percentage}%)"
echo "Most Active User: $most_active_user"
