#!/bin/bash
grep -i -E "iptables -A|ufw allow|firewall rule added" auth.log | wc -l
