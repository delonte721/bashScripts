#!/bin/bash
if [ $# -lt 1 ]; then
    echo ""
    echo "This script will show the every hop in a redirection for a file."
    echo "--- Incorrect Syntax ----"
    echo "Usage: $0 <file name>"
    echo "Example: $0 redirects.txt"
    echo ""
    exit
fi
for x in `grep -v ^# $1 | awk '{print $1}'`; do
    URL=`echo $x | awk -F ',' '{print $3}'` #grab the URL from the file
    curl=`curl -I $URL 2>/dev/null | head -n 1` #get the initial status code
    if [[ `echo $curl | grep -E 301\|302` ]]; then #the while loop follows the redirect/ show all of the redirects
        while [ $URL ]; do
            URL=$(curl -sw "\n\n%{redirect_url}" "${URL}" | tail -n 1) #get the next location from curl
            if [ $URL ]; then
                trail=$trail,$URL #append new URL in the trail
            fi
        done
    fi
    echo $x$trail #print the file with the trail appended
done
