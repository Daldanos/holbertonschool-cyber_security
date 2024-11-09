#!/bin/bash
sudo nmap -p $2 --scanflags SYN,ACK,FIN,RST,URG,PSH -oN custom_scan.txt $1 &>/dev/null 2>&1
