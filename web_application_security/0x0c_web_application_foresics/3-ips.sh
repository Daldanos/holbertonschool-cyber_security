#!/bin/bash
grep "Accepted password" auth.log | awk -F'[ :]+' '{for(i=1; i<=NF; i++) if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $i}' | sort -u | wc -l
