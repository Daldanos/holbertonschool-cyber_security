#!/bin/bash
nmap -p 80 --script http-vuln-cve2017-5638 -oN vuln_scan_results.txt "$1"
