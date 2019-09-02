#!/bin/bash
#TLDShort
domain=$1
tld=`echo $1 | awk -F '.' '{print $2}'`
foo=`host -t ns $tld | grep 'name server' | head -n 1 | awk '{print $4}'`
dig=`dig $domain @$foo | grep 'IN\sNS' | head -n 1 | awk '{print $5}'`
record=`dig $domain @$dig +short`
echo $record