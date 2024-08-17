#!/bin/bash
whois $1 | awk -F': ' '/^Registrant/ || /^Admin/ || /^Tech/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); gsub(/[ \t]+$/, "", $1); print $1 "," $2}' > "$1.csv"
