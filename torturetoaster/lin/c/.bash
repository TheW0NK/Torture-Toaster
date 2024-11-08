#!/bin/bash

# This script will allocate memory continuously until the system runs out of memory.
while true; do
    # Allocate 100MB of memory and keep it in use
    python3 -c "a = ' ' * 100000000"
    sleep 1
done