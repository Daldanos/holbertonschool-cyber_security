#!/bin/bash
echo -n "${1#*xor}" | base64 -d | while IFS= read -n1 c; do printf "\\$(printf '%03o' "$(( $(printf '%d' "'$c") ^ 53 ))")"; done
echo
