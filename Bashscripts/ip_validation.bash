#!/bin/bash

# Function to validate IP address
validate_ip() {
    local ip=$1
    # Regular expression for validating IPv4 address
    local regex="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

    if [[ $ip =~ $regex ]]; then
        # Check if all octets are in the range 0-255
        IFS='.' read -r -a octets <<< "$ip"
        for octet in "${octets[@]}"; do
            if [[ $octet -gt 255 || $octet -lt 0 ]]; then
                echo "Invalid IP: $ip"
                return 1
            fi
        done
        echo "Valid IP: $ip"
    else
        echo "Invalid IP: $ip"
        return 1
    fi
}

# Read input IP address
read -p "Enter an IP address: " ip
validate_ip "$ip"
