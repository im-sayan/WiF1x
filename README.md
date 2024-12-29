WiF1x Scanner

WiF1x Scanner is a simple and efficient shell script designed to scan Wi-Fi networks in real-time using the nmcli command. It displays the available networks along with additional network details such as signal strength, security type, and interface name. The script runs continuously, updating every 0.3 seconds, to provide live updates on nearby networks.

Features

    Real-time Wi-Fi network scanning: Continuously scans and updates available networks.
    Network details: Displays SSID, signal strength, and security type for each network.
    Active interface detection: Automatically detects the active Wi-Fi interface and displays it.
    Aesthetic output: Customizable ASCII art header and color scheme for a "hacker" style interface.
    Interval control: Configurable scanning interval (default is 0.3 seconds).
    Compatibility: Works with Linux-based systems that have nmcli and NetworkManager installed.

Prerequisites

Ensure you have the following installed on your system:

    NetworkManager: Provides the nmcli tool for network management and scanning.
    Bash: The script is written in Bash, so a compatible shell is required.

Install NetworkManager (if not installed)

On Debian/Ubuntu-based systems:

sudo apt-get update
sudo apt-get install network-manager

On Red Hat/CentOS-based systems:

sudo yum install NetworkManager

Usage
1. Clone the repository

First, clone this repository to your local machine:

git clone https://github.com/im-sayan/WiF1x.git
cd WiF1x-Scanner

2. Run the script

To start scanning for Wi-Fi networks, simply execute the script:

chmod +x scan_wifi.sh
./scan_wifi.sh
