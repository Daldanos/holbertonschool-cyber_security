#!/bin/bash
echo -n "${1#*xor}" | base64 -d | while IFS= read -n1 -r c; do printf "\x$(printf '%x' $(( $(printf '%d' "'$c") ^ 53 ))"; done
echo
