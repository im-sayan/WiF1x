#!/bin/bash

# Interval in seconds between each scan
INTERVAL=0.3  # Adjusted for stability and usability

# Bright Bold Colors
BOLD_BRIGHT_BLACK='\033[1;90m'
BOLD_BRIGHT_RED='\033[1;91m'
BOLD_BRIGHT_GREEN='\033[1;92m'
BOLD_BRIGHT_YELLOW='\033[1;93m'
BOLD_BRIGHT_BLUE='\033[1;94m'
BOLD_BRIGHT_MAGENTA='\033[1;95m'
BOLD_BRIGHT_CYAN='\033[1;96m'
BOLD_BRIGHT_WHITE='\033[1;97m'

# Reset
RESET='\033[0m'


# Function to display a dynamic "hacker" header with the name WiF1x
function hacker_header() {
    local term_width
    term_width=$(tput cols)  # Get terminal width
    local header="WiF1x Scanner - @Develop by SaYan"
    local padding=$(( (term_width - ${#header}) / 2 ))

    echo -e "${BOLD_BRIGHT_CYAN}"
    printf "%*s%s\n" "$padding" "" "███████╗██╗██╗    ██╗██╗██╗  ██╗"
    printf "%*s%s\n" "$padding" "" "██╔════╝██║██║    ██║██║██║ ██╔╝"
    printf "%*s%s\n" "$padding" "" "█████╗  ██║██║ █╗ ██║██║█████╔╝ "
    printf "%*s%s\n" "$padding" "" "██╔══╝  ██║██║███╗██║██║██╔═██╗ "
    printf "%*s%s\n" "$padding" "" "██║     ██║╚███╔███╔╝██║██║  ██╗"
    printf "%*s%s\n" "$padding" "" "╚═╝     ╚═╝ ╚══╝╚══╝ ╚═╝╚═╝  ╚═╝"
    printf "%*s%s\n" "$padding" "" "$header"
    echo -e "${RESET}"
}

# Check if nmcli is installed
if ! command -v nmcli &>/dev/null; then
    echo -e "${RED}Error: 'nmcli' command not found. Please install NetworkManager.${RESET}"
    exit 1
fi

# Main loop to scan Wi-Fi networks
while true; do
    clear
    hacker_header
    echo "Scanning for Wi-Fi networks... (Press Ctrl+C to exit)"
    echo -e "${BOLD_BRIGHT_GREEN}"

    # Run the scan and handle cases with no results
    scan_output=$(nmcli dev wifi)
    if [ -z "$scan_output" ]; then
        echo -e "${RED}[!] No Wi-Fi networks found. Ensure your Wi-Fi is enabled.${RESET}"
    else
        echo "$scan_output" | sed 's/^/[+] /'  # Add "[+] " prefix for styling
    fi

    echo -e "${RESET}"
    echo "Scan completed at: $(date)"  # Display the current timestamp
    sleep "$INTERVAL"  # Respect the interval
done

