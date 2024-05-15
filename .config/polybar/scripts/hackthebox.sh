#!/bin/sh

IFACE=$(ip -o -4 address show dev tun0 2>/dev/null | awk '{print $2}')

if [ "$IFACE" = "tun0" ]; then
	IP=$(ip a show tun0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
	echo "%{F#00FF00}%{F-} $IP"
else
	echo "%{F#00FF00}%{F-} Disconnected"
fi
