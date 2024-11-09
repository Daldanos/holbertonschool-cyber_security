#!/bin/bash
sudo nmap -sA -p $2 --host-timeout 1000ms -v -reason $1
