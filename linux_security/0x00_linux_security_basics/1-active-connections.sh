#!/bin/bash
sudo ss -t -p -n | grep -E 'LISTEN|ESTAB'
