#!/bin/bash

# Interval in seconds between each scan
INTERVAL=0.1  # Adjusted for stability and usability

# Colors for the "hacker" effect
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to display a "hacker" header with the name WiF1x
function hacker_header() {
    echo -e "${CYAN}"
    echo "██╗    ██╗██╗███████╗██╗  ██╗"
    echo "██║    ██║██║██╔════╝██║ ██╔╝"
    echo "██║ █╗ ██║██║█████╗  █████╔╝ "
    echo "██║███╗██║██║██╔══╝  ██╔═██╗ "
    echo "╚███╔███╔╝██║███████╗██║  ██╗"
    echo " ╚══╝╚══╝ ╚═╝╚══════╝╚═╝  ╚═╝"
    echo "         WiF1x Scanner       "
    echo "     @ Develop by SaYan      "
    echo -e "${RESET}"
}

# Function to generate fake "hacker" matrix output
function hacker_matrix() {
    for _ in {1..5}; do
        echo -ne "${GREEN}"
        cat /dev/urandom | tr -cd 'A-Za-z0-9!@#$%^&*()_+-=[]{}|;:<>,.' | head -c $((RANDOM % 50 + 20))
        echo -e "${RESET}"
    done
}

# Main loop to scan Wi-Fi networks
while true; do
    clear
    hacker_header                  # Call the hacker header function
    echo "Scanning for Wi-Fi networks..."
    echo -e "${GREEN}"
    nmcli dev wifi | sed 's/^/[+] /'  # Add "[+] " prefix for styling
    echo -e "${RESET}"
    sleep $INTERVAL                # Respect the interval
done

