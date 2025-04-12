#!/bin/bash
grep -E "new user|useradd" auth.log | awk -F'=' '{print $2}' | awk -F',' '{print $1}' | sort -u | tr '\n' ',' | sed 's/,$//' && echo
