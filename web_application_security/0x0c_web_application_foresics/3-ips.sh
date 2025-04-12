#!/bin/bash
grep -i -E "iptables -A|iptables -I|ufw allow|adding firewall rule" auth.log | wc -l
