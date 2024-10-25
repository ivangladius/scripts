#!/bin/bash

# Check if the required arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <interface> <ip-address>"
    exit 1
fi

# Assign command-line arguments to variables
INTERFACE="$1"
STATIC_IP="$2"

# Remove any existing /xx subnet mask from the IP address
STATIC_IP_CLEAN=$(echo $STATIC_IP | cut -d'/' -f1)

# Deactivate any existing connections on the interface
sudo nmcli device disconnect "$INTERFACE"

# Remove any existing connections for the interface
EXISTING_CONNECTIONS=$(nmcli -t -f NAME,DEVICE connection show | grep ":$INTERFACE$" | cut -d':' -f1)
for conn in $EXISTING_CONNECTIONS; do
    sudo nmcli connection delete "$conn"
done

# Use nmcli to set the static IP without gateway or DNS, and disable IPv6
if sudo nmcli connection add type ethernet ifname "$INTERFACE" \
    ipv4.method manual \
    ipv4.addresses "$STATIC_IP_CLEAN/24" \
    ipv6.method ignore; then
    
    # Activate the new connection
    if sudo nmcli connection up "ethernet-$INTERFACE"; then
        echo "Static IP address $STATIC_IP_CLEAN has been set on $INTERFACE using nmcli. IPv6 has been disabled."
    else
        echo "Error: Failed to activate the connection."
        exit 1
    fi
else
    echo "Error: Failed to create the connection."
    exit 1
fi

# Display the new IP configuration
ip addr show "$INTERFACE"
