#!/bin/sh

IP=$(ip a show eth0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
echo "%{F#3682ff}%{F-} $IP"
