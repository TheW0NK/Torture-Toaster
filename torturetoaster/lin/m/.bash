#!/bin/bash

# Function to estimate crash risk
estimate_crash_risk() {
    local cpu_usage=$1
    local free_mem=$2

    if (( cpu_usage > 90 && free_mem < 100000 )); then
        echo "High"
    elif (( cpu_usage > 75 && free_mem < 200000 )); then
        echo "Medium"
    else
        echo "Low"
    fi
}

# Monitor system resources and display in a neat ASCII table
while true; do
    clear
    echo ------------------------
    echo Torture toaster V0.1.0
    echo ------------------------
    echo
    echo
    echo
    echo "System Resource Usage"
    echo "---------------------"
    echo "Time       CPU (%)   Memory (kB)  Crash Risk"
    echo "---------------------------------------------"
    vmstat 1 2 | tail -1 | awk -v date="$(date +'%H:%M:%S')" '{
        cpu_usage = 100 - $15;
        free_mem = $4;
        printf "%-10s %-8s %-10s ", date, cpu_usage, free_mem;
    }' | while read -r line; do
        cpu_usage=$(echo $line | awk '{print $2}')
        free_mem=$(echo $line | awk '{print $3}')
        crash_risk=$(estimate_crash_risk $cpu_usage $free_mem)
        echo "$line $crash_risk"
    done
    sleep 1
done