#!/bin/bash
b64=${1#*\}} # elimina todo hasta la primera }
echo "$b64" | base64 -d 2>/dev/null | od -An -t u1 | tr -s ' ' | \
while read -a bytes; do
  for key in {1..255}; do
    out=""
    for b in "${bytes[@]}"; do
      out+=$(printf "\\x%02x" $((b ^ key)))
    done
    [[ $out == "yosri_check_value" ]] && echo "ok" && exit 0
  done
done
echo "invalid"
