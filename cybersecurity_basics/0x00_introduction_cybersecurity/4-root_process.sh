#!/bin/bash
ps -u "$1" -o user,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,cmd | awk 'NR>1 && $5>0 && $6>0'
