#!/bin/bash
sudo nmap -sA -p http,https,ssh,telnet,ftp -v $1
