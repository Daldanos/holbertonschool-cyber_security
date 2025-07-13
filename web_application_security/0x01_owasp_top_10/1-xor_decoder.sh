#!/bin/bash
echo -n "${1#*xor}" | base64 -d | od -An -t u1 | tr -s ' ' | \
while read -a bytes; do
  for b in "${bytes[@]}"; do
    printf \\x%02x $((b ^ 53))
  done
done
echo

