#!/bin/bash
curl -X POST "$1" -H "Host: $2" -d "$3"
