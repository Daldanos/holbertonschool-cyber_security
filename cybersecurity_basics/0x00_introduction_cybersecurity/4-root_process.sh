#!/bin/bash
ps aux | grep "^$1 " | awk '$5>0 && $6>0'
