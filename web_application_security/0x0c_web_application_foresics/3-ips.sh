#!/bin/bash
awk '/Failed password|Accepted password/ {print $11}' auth.log | sort -u | wc -l
