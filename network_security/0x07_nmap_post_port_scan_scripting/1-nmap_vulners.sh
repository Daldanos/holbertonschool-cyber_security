#!/bin/bash
nmap -sV --script vulners --script-args mincvss=5.0 -p 80,443 "$1"
