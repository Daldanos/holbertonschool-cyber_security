#!/bin/bash
if [ ! -f "auth.log" ]; then
    echo "Error: El archivo auth.log no existe en el directorio actual."
    exit 1
fi

grep "Accepted password" "auth.log" | awk '{print $11}' | sort -u | wc -l
