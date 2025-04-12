#!/bin/bash
tail -n 1000 auth.log | awk '
/Failed password/ {
    for (i=1; i<=NF; i++) if ($i == "for") fail[$(i+1)]++
}
/Accepted password/ {
    for (i=1; i<=NF; i++) if ($i == "for") success[$(i+1)]++
}
END {
    for (user in success)
        if (fail[user]) print user
}'

