#!/bin/bash
sudo nmap -p $2 -sA --tcp-flags ALL ALL -oN custom_scan.txt $1 &> /dev/null
