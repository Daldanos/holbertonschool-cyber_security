#!/bin/bash
nmap -A -T4 --script "banner,ssl-enum-ciphers,smb-enum-domains,default" -oN service_enumeration_results.txt $1
