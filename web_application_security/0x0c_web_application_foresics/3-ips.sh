#!/bin/bash
num_atacantes=$(awk '/Failed password/ {print $11}' auth.log | sort -u | wc -l)
echo $num_atacantes
