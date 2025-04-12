#!/bin/bash
awk '/pam_unix/ {print $0}' auth.log | sort | uniq -c | sort -nr
