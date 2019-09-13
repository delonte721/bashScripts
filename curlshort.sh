#!/bin/bash
#curlshort 
URL=$1
curl=`curl -I $URL 2>/dev/null | head -n 1`
redirect=`curl -I -Ls -o /dev/null -w %{url_effective} $URL`
location=`curl -I $redirect 2>/dev/null | head -n 1`
chain=`curl --head --silent --location --output /dev/null --write-out "It took %{num_redirects} redirect/redirects to get %{url_effective}\n" $URL`
   
   if  [[ `echo $curl | grep -E 301\|302` ]]; 
   then 
      echo $location
   else 
      echo $curl
   fi
   
    while [ -n "${URL}" ]
do
    echo $URL
    URL=$(curl -sw "\n\n%{redirect_url}" "${URL}" | tail -n 1)
done

   if [[ $2 == *"trace"* ]]; 
   then
      echo $chain
   fi   