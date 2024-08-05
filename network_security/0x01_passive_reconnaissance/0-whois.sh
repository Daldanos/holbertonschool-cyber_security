#!/bin/bash
sudo whois $1 | awk -F":" '/Registrant |Admin |Tech / {printf "%s,",$2} END {print ""}'  > "$1.csv"
