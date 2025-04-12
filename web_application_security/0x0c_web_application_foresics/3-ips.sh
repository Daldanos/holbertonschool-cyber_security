#!/bin/bash
ips=$(awk '/Accepted password/ || /Failed password/ {print $11}' auth.log)
unique_ips=$(echo "$ips" | sort -u)
num_atacantes=$(echo "$unique_ips" | wc -l)
echo "$num_atacantes"
