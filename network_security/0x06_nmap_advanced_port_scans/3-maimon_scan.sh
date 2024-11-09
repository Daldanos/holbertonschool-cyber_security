#!/bin/bash
sudo nmap -sA -p 21,22,23,80,443 -v $1
