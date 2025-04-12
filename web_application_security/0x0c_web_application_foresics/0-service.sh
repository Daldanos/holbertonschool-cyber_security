#!/bin/bash
awk '/pam_unix/ {print $0}' /path/to/logfile | sort | uniq -c | sort -nr
