#!/bin/bash

while true; do
    STR="$RANDOM $(date)"
    echo $STR > /var/tmp/junk.txt
    sleep 1;
done
