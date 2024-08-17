#!/bin/bash
whois $1 | awk -F': ' '/^Registrant|^Admin|^Tech/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); print $1 "," $2}' OFS=',' > "$1.csv"
