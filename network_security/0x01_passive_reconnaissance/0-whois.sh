#!/bin/bash
sudo whois $1 | awk -F': ' 'BEGIN {OFS=", "} /Registrant |Admin |Tech / {gsub(/^ +| +$/, "", $2); print $1, $2}'  > "$1.csv"
