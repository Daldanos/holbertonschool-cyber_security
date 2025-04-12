#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Uso: $0 <auth.log>"
    exit 1
fi

grep "Accepted password" "$1" | awk '{print $11}' | sort -u | wc -l
