#!/bin/bash
file=${1:-logs.txt}
ip=$(cut -d' ' -f1 "$file" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
grep -c "^$ip " "$file"
