#!/bin/bash
#curlshort 
URL=$1
curl=`curl -I $URL 2>/dev/null | head -n 1`
redirect=`curl -I -Ls -o /dev/null -w %{url_effective} $URL`
if  [[ `echo $curl | grep -E 301\|302` ]]; 
then 
  echo $redirect
else 
   echo $curl
fi