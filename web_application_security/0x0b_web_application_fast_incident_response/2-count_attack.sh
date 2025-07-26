#!/bin/bash
ip=$(cut -d' ' -f1 "$1" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
grep -c "^$ip " "$1"
