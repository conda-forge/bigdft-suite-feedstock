#!/bin/bash

bigdft

# Define the hardcoded value result
hardcoded_value=-2.88939835588

# Grep for the line with "Energy (Hartree)"
value=$(grep "Energy (Hartree)" log.yaml | awk '{print $NF}')

# If value is not present, exit with an error
if [ -z "$value" ]; then
    echo "Error: Could not find line energy"
    exit 1
fi

# Calculate the absolute difference
difference=$(echo "$value - $hardcoded_value" | bc -l | awk '{if ($1<0) print -$1; else print $1}')

# If the difference is greater than a threshold, raise an error
if (( $(echo "$difference > 1e-6" | bc -l) )); then
    echo "Error: Computed energy difference $difference is greater than 1e-6"
    exit 1
fi

