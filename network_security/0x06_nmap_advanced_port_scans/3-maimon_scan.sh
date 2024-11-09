#!/bin/bash
sudo nmap -sM -p http,https,ssh,telnet,ftp -vv $1
