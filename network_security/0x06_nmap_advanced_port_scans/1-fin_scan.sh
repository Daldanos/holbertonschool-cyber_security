#!/bin/bash
sudo nmap -sF -p 80-85 --mtu 8 -T2 $1
