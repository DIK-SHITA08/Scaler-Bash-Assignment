#!/bin/bash

# Check if the service name is provided as a command line argument
if [ -z "$1" ]; then
    echo "Error: Service name is required."
    exit 1
fi

# Define the service status messages
SERVICE_RUNNING="The service is running."
SERVICE_STOPPED="The service is not running."

# Check if the service is running
if sc query "$1" | grep -q "STATE.*RUNNING"; then
    echo "$SERVICE_RUNNING"
else
    echo "$SERVICE_STOPPED"
fi
