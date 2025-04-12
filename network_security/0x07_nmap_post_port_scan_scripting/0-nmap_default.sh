#!/bin/bash
nmap -sC -sV -oA nmap_default_scan "$1"
