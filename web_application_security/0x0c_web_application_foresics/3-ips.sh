#!/bin/bash
grep "Accepted password" auth.log | grep -oE 'from [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk '{print $2}' | sort -u | wc -l
