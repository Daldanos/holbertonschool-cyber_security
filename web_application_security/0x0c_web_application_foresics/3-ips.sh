#!/bin/bash
awk '{print $1}' access.log | sort -u | wc -l
