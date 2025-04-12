#!/bin/bash
tail -n 1000 auth.log | awk '/Failed password/ {fail[$NF]++} /Accepted password/ {success[$NF]++} END {for (u in success) if (fail[u]) print u}'
