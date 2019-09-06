#!/bin/bash
#curlshort 
URL=$1
curl=`curl -I $URL 2>/dev/null | head -n 1`
location=`curl -I $URL 2>/dev/null | head -n 5`
if  [[ `echo $curl | grep -E 301\|302` ]]; 
then 
    echo $location
else 
    echo $curl
fi