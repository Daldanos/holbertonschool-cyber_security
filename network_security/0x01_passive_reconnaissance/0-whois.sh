#!/bin/bash
whois $1 | awk -F': ' '/^Registrant|^Admin|^Tech/ {gsub(/^[ \t]+|[ \t]+$/, "", $2); printf "%s,%s%s\n", $1, $2, (length($2) % 2 ? "" : "")}' OFS=',' > "$1.csv"
