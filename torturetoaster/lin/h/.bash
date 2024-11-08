#!/bin/bash

# Get total memory in kB
total_mem=$(grep MemTotal /proc/meminfo | awk '{print $2}')

# Calculate 95% of total memory in bytes
mem_to_allocate=$((total_mem * 95 / 100 * 1024))

# Allocate memory
python3 -c "a = ' ' * $mem_to_allocate"

# Keep the script running to hold the allocated memory
while true; do
    sleep 1
done