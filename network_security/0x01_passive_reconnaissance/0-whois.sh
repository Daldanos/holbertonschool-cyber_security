#!/bin/bash
whois $1 | awk -F":" "/Registrant |Admin |Tech/"  > "$1.csv"
