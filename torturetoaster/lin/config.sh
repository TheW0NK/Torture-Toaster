#!/bin/bash

# Configuration file for Torture Toaster

# Set the default values for the configuration variables
TOASTER_MODE="normal"  # Options: normal, turbo, eco
TOAST_LEVEL=3          # Range: 1-5
TOAST_TIME=120         # Time in seconds
LOG_FILE="/var/log/torturetoaster.log"
ALLOW_CRASH=true

# Function to load the configuration from a file
load_config() {
    if [ -f "$1" ]; then
        source "$1"
    else
        echo "Configuration file not found: $1"
        exit 1
    fi
}

# Function to save the current configuration to a file
save_config() {
    cat <<EOL > "$1"
TOASTER_MODE="$TOASTER_MODE"
TOAST_LEVEL=$TOAST_LEVEL
TOAST_TIME=$TOAST_TIME
LOG_FILE="$LOG_FILE"
EOL
}

# Example usage:
# load_config "/path/to/config.sh"
# save_config "/path/to/config.sh"