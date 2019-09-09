#!/bin/bash
#curlshort 
URL=$1
curl=`curl -I $URL 2>/dev/null | head -n 1`
redirect=`curl -I -Ls -o /dev/null -w %{url_effective} $URL`
location=`curl -I $redirect 2>/dev/null | head -n 1`
if  [[ `echo $curl | grep -E 301\|302` ]]; 
then 
 echo $location
else 
   echo $curl
fi